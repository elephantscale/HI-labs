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

//JDK API docs : http://docs.oracle.com/javase/7/docs/api/
//Hadoop API docs : http://hadoop.apache.org/docs/stable/api/

public class Counter extends Configured implements Tool {
  public static void main(String[] args) throws Exception {
    int res = ToolRunner.run(new Configuration(), new Counter(), args);
    System.exit(res);
  }

  @Override
  public int run(String[] args) throws Exception {

    if (args.length != 2) {
      System.out.println("usage : need <input path>  <output path>");
      return 1;
    }
    Path inputPath = new Path(args[0]);
    Path outputPath = new Path(args[1]);

    Configuration conf = getConf();

    Job job = new Job(conf, getClass().getName() + "--<your_name>"); // TODO
    job.setJarByClass(Counter.class);
    job.setMapperClass(MyMapper.class);
    job.setReducerClass(MyReducer.class);
    job.setMapOutputValueClass(IntWritable.class);
    job.setMapOutputKeyClass(Text.class);
    job.setInputFormatClass(TextInputFormat.class);
    job.setOutputFormatClass(TextOutputFormat.class);
    TextInputFormat.setInputPaths(job, inputPath);
    TextOutputFormat.setOutputPath(job, outputPath);

    int retCode = job.waitForCompletion(true) ? 0 : 1;
    return retCode;

    /*
     /// TODO : the following is for bonus lab

    if (retCode != 0)
      return retCode; // Job failed, return

    /// TODO : find the counter values
    // look at 'counters.txt' for description of all counters
    long inputRecordCount = job.getCounters()
        .findCounter("group_name ???", "counter_name  ???").getValue();
    long failedRecordCount = job.getCounters()
        .findCounter("group_name ???", "counter_name ???").getValue();

    int retCode2 = 0;
    /// TODO : return a failure code if more than 5% of the records are bad

    return retCode2;
    */
  }

  static class MyMapper extends Mapper<Object, Text, Text, IntWritable> {

    private static enum Counters {
      BAD_RECORDS
    }

    @Override
    public void map(Object key, Text record, Context context)
        throws IOException {
      // System.out.println (record);
      try {
        // / TODO : split the records into tokens
        // String[] tokens = record.toString().
        // System.out.println (Arrays.toString(tokens));

        // / TODO : check token length
        // if (tokens.length != 5) {
        // / TODO : increment counter
        // context.getCounter(Counters.BAD_RECORDS).increment(?);

        // / TODO : what do we do now? continue or return?
        // }

        // / TODO : extract fields
        // String customerIdStr = tokens[1].trim();
        // String costStr = .....
        // int cost = ....

        // / TODO : create output key / value pair
        // Text keyOutCustomer = new Text(???);
        // IntWritable valueOutCost = new IntWritable(???);
        // context.write(keyOutCustomer, valueOutCost);

      } catch (Exception e) {
        // System.out.println("*** exception:");
        // e.printStackTrace();

        // TODO increment counter
      }
    }

  }

  public static class MyReducer extends
      Reducer<Text, IntWritable, Text, IntWritable> {

    public void reduce(Text key, Iterable<IntWritable> results, Context context)
        throws IOException, InterruptedException {
      int total = 0;
      for (IntWritable cost : results) {
        total += cost.get();
      }
      context.write(key, new IntWritable(total));

    }

  }

}
