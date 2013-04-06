package hi.mr;

import java.io.IOException;
import java.util.Arrays;


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

// this implementation is a polished mapreduce, ready for production
public class BillingPolished extends Configured implements Tool
{
    public static void main(String[] args) throws Exception
    {
        int res = ToolRunner.run(new Configuration(), new BillingPolished(), args);
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
        job.setJarByClass(BillingPolished.class);
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
        // NOTE : get in the habit of using counters
        private static enum Counters
        {
            BAD_RECORDS
        }

        // NOTE : we are creating the output key,values as a class variables.
        // this reduces creating a lot of temporary variables within map function
        Text keyOutCustomer = new Text();
        IntWritable valueOutCost = new IntWritable();

        @Override
        public void map(Object key, Text record, Context context) throws IOException
        {
//            System.out.println (record);
            try
            {
                String [] tokens = record.toString().split(",");
//                System.out.println (Arrays.toString(tokens));
                if (tokens.length != 5)
                {
                    context.getCounter(Counters.BAD_RECORDS).increment(1);
                    return;
                }

                String timestampStr = tokens[0].trim();
                String customerIdStr = tokens[1].trim();
                String costStr = tokens[4].trim();

                // NOTE : we may get an exception here, if the costStr is not really a number
                // that is ok, it will be caught by try/catch
                int cost = Integer.parseInt(costStr);

                // NOTE : instead of creating a Text and IntWritable variables every time
                // we are just setting the values here
                // this reduces temporary variable creation
                keyOutCustomer.set(customerIdStr);
                valueOutCost.set(cost);

                context.write(keyOutCustomer, valueOutCost);

            } catch (Exception e)
            {
                // NOTE : it is nice to do a try/catch block in a mapper ,
                // so invalid input doesn't cause any errors.
                // We don't print out the exception
                // instead we increment BAD_RECORDS counter
                context.getCounter(Counters.BAD_RECORDS).increment(1);
            }
        }

    }

    public static class MyReducer extends Reducer<Text, IntWritable, Text, IntWritable>
    {
        //NOTE : instead of creating ad-hoc temporary variables, we are re-using a class variable
        IntWritable valueOut = new IntWritable();

        public void reduce(Text key, Iterable<IntWritable> results, Context context) throws IOException,
                InterruptedException
        {
            int total = 0;
            for (IntWritable cost : results)
            {
                total += cost.get();
            }
            valueOut.set(total);
            context.write(key, valueOut);

        }

    }

}
