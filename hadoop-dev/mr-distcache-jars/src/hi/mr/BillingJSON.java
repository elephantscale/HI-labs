package hi.mr;

import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

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

public class BillingJSON extends Configured implements Tool
{
    public static void main(String[] args) throws Exception
    {
        int res = ToolRunner.run(new Configuration(), new BillingJSON(), args);
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

        Job job = new Job(conf, getClass().getName() + "--<your_name>"); // TODO
        job.setJarByClass(BillingJSON.class);
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

        private static enum Counters
        {
            BAD_RECORDS
        }

        @Override
        public void map(Object key, Text record, Context context) throws IOException
        {
//            System.out.println (record);
            try
            {
                Gson gson = new Gson();
                Map<String, String> jsonMap = gson.fromJson(record.toString(), new TypeToken<Map<String, String>>()
                {
                }.getType());

                String timestampStr = jsonMap.get("timestamp_ms");
                // TODO : get other attributes
                String customerIdStr = "";
                String costStr = "";

                int cost = Integer.parseInt(costStr);

                Text keyOutCustomer = new Text(customerIdStr);
                IntWritable valueOutCost = new IntWritable(cost);

                context.write(keyOutCustomer, valueOutCost);

            } catch (Exception e)
            {
//                System.out.println("*** exception:");
//                e.printStackTrace();
                context.getCounter(Counters.BAD_RECORDS).increment(1);
            }
        }

    }

    public static class MyReducer extends Reducer<Text, IntWritable, Text, IntWritable>
    {

        public void reduce(Text key, Iterable<IntWritable> results, Context context) throws IOException,
                InterruptedException
        {
            int total = 0;
            for (IntWritable cost : results)
            {
                total += cost.get();
            }
            context.write(key, new IntWritable(total));

        }

    }

}
