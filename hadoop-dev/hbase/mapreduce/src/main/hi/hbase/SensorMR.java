package hi.hbase;

import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.filter.FirstKeyOnlyFilter;
import org.apache.hadoop.hbase.io.ImmutableBytesWritable;
import org.apache.hadoop.hbase.mapreduce.TableMapReduceUtil;
import org.apache.hadoop.hbase.mapreduce.TableMapper;
import org.apache.hadoop.hbase.mapreduce.TableReducer;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.mapreduce.Job;

/**
 * before running this mr job, make sure to have two tables: for raw data :
 * '<your name>_sensors' , 'd'
 *
 * for summary data : '<your name>_sensor_summmary', 'd'
 *
 */
public class SensorMR {

  static final String tableRawData = "<yourname>_sensors"; // TODO update table
                                                           // name
  static final String tableSummaryData = "<your name>_sensor_summary"; // TODO
                                                                       // update
                                                                       // table
                                                                       // name

  public static void main(String[] args) throws Exception {
    Configuration conf = HBaseConfiguration.create();
    Job job = new Job(conf, SensorMR.class.getName() + "--<your name>"); // TODO
    job.setJarByClass(SensorMR.class);
    Scan scan = new Scan();
    scan.setFilter(new FirstKeyOnlyFilter());
    TableMapReduceUtil.initTableMapperJob(tableRawData, scan, Mapper1.class,
        ImmutableBytesWritable.class, FloatWritable.class, job);
    TableMapReduceUtil.initTableReducerJob(tableSummaryData, Reducer1.class,
        job);
    TableMapReduceUtil.addDependencyJars(job);
    System.exit(job.waitForCompletion(true) ? 0 : 1);
  }

  static class Mapper1 extends
      TableMapper<ImmutableBytesWritable, FloatWritable> {

    static final byte[] family = Bytes.toBytes("d");
    static final byte[] ColTemp = Bytes.toBytes("temp");

    FloatWritable floatWritable = new FloatWritable();

    @Override
    public void map(ImmutableBytesWritable row, Result result, Context context)
        throws IOException {
      // TODO extract 'temp' column valu from result
      // KeyValue kv = .....
      // if (kv != null) {

      // TODO : extract temp value (float)
      // float temp = ....
      // floatWritable.set(temp);
      //  try {
      //    context.write(row, floatWritable);        //   TODO : finally emit
      //  } catch (InterruptedException e) {
      //    throw new IOException(e);
      //  }
      // }

    }
  }

  public static class Reducer1
      extends
      TableReducer<ImmutableBytesWritable, FloatWritable, ImmutableBytesWritable> {

    static final byte[] family = Bytes.toBytes("d");
    static final byte[] columnMaxTemp = Bytes.toBytes("maxTemp");
    static final byte[] columnMinTemp = Bytes.toBytes("minTemp");

    @Override
    public void reduce(ImmutableBytesWritable key,
        Iterable<FloatWritable> values, Context context) throws IOException,
        InterruptedException {

      float maxTemp = 999;
      float minTemp = 999;  // TODO : set these to appropriate initial values
      /// TODO : iterate throuth values
      /// extract temp,  calculate max / min
      int count = 0;
      for (FloatWritable val : values)
      {
        float temp = val.get();
        /// TODO : calculate min, max
      }

      /// once we have min, max temps.. save them
      Put put = new Put(key.get());
      /// TODO : populate the Put with min, max temp
      context.write(key, put);

      /// debug
      System.out.println(String.format(
          "sensor : %d,    maxTemp : %f,  minTemp : %f, record#count : %d",
          Bytes.toInt(key.get()), maxTemp, minTemp, count));
    }
  }

}