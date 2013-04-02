package hi.mr;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;

// calculates billing by customer & resource
public class BillingLookupAnswer extends Configured implements Tool
{
    public static void main(String[] args) throws Exception
    {
        int res = ToolRunner.run(new Configuration(), new BillingLookupAnswer(), args);
        System.exit(res);
    }

    @Override
    public int run(String[] args) throws Exception
    {

        if (args.length != 2)
        {
            System.out.println("usage : need <input path>  <output path>");
            return 1;
        }
        Path inputPath = new Path(args[0]);
        Path outputPath = new Path(args[1]);

        Configuration conf = getConf();

        Job job = new Job(conf, getClass().getName());
        job.setJarByClass(BillingLookupAnswer.class);
        job.setMapperClass(MyMapper.class);
        job.setReducerClass(MyReducer.class);
        job.setMapOutputValueClass(IntWritable.class);
        job.setMapOutputKeyClass(Text.class);
        job.setInputFormatClass(TextInputFormat.class);
        job.setOutputFormatClass(TextOutputFormat.class);
        TextInputFormat.setInputPaths(job, inputPath);
        TextOutputFormat.setOutputPath(job, outputPath);

        return job.waitForCompletion(true) ? 0 : 1;
    }

    static class MyMapper extends Mapper<Object, Text, Text, IntWritable>
    {

        @Override
        public void map(Object key, Text record, Context context) throws IOException
        {
            // System.out.println (record);
            try
            {
                String[] tokens = record.toString().split(",");
                // System.out.println (Arrays.toString(tokens));

                String timestampStr = tokens[0].trim();
                String customerIdStr = tokens[1].trim();
                String resourceStr = tokens[2].trim();
                String costStr = tokens[4].trim();

                int cost = Integer.parseInt(costStr);

                Text keyOutCustomer = new Text(customerIdStr + "_" + resourceStr);
                IntWritable valueOutCost = new IntWritable(cost);

                context.write(keyOutCustomer, valueOutCost);

            } catch (Exception e)
            {
                System.out.println("*** exception:");
                e.printStackTrace();
            }
        }

    }

    public static class MyReducer extends Reducer<Text, IntWritable, Text, IntWritable>
    {

        Properties resourceMappings;

        @Override
        protected void setup(Context context) throws IOException, InterruptedException
        {
            // read in resource mappings
            // setup : only do it once for the life of this reducer
            this.resourceMappings = new Properties();
            this.resourceMappings.load(new FileReader("resource.properties"));
            System.out.println("loaded resource mappings:\n" + this.resourceMappings);
        }

        public void reduce(Text key, Iterable<IntWritable> results, Context context) throws IOException,
                InterruptedException
        {
            try
            {
                // our key is customerID_resourceID
                String [] tokens = key.toString().split("_");
                if (tokens.length  == 2)
                {
                    String customerIdStr = tokens[0];
                    String resourceIdStr = tokens[1];

                    String resourceName = this.resourceMappings.getProperty(resourceIdStr, "Unknown");

                    int total = 0;
                    for (IntWritable cost : results)
                    {
                        total += cost.get();
                    }
                    Text newKey = new Text (customerIdStr + "_" + resourceName);
                    context.write(newKey, new IntWritable(total));
                }

            } catch (Exception e)
            {
            }

        }

    }

}
