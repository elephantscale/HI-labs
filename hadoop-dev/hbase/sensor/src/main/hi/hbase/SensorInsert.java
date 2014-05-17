package hi.hbase;

import java.io.IOException;
import java.util.Random;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.util.Bytes;

/**
 * before running this, create '<yourname>_sensors' table (replace <yourname> with
 * your username) in hbase shell: create '<yourname>_sensors', 'd'
 */
public class SensorInsert {

  // TODO : update the table name with your username
  static String tableName = "<your name>_sensors";
  static String familyName = "d";

  public static void main(String[] args) throws Exception {
    Configuration config = HBaseConfiguration.create();
    // TODO : Create an htable instance
    HTable htable = null;

    int total = 1000;
    Random rand = new Random();
    long t1 = System.currentTimeMillis();
    for (int i = 0; i < total; i++) {
      int sensorId = rand.nextInt(total / 10);
      /// generate a random timestamp (in milliseconds) for year 2014
      /// check : http://www.epochconverter.com/
      long timestamp = (long) (1388534400 + rand.nextDouble() * 60 * 60 * 24
          * 365) * 1000;
      /// TODO : calculate reverse Timestamp
      // long reverseTimeStamp = ...

      /// TODO : create a COMPOSITE row key with sensorId & reverse-timestamp
      /// use Bytes.add() method to combine two byte arrays
      // byte[] rowkey = ...

      // TODO : create random float number between 0 and 100 for temperature & humidity
      // float temperature = ...
      // float humidity =

      // TODO : create a Put object and add temperature & humidity
      // Put put = new Put(.......);
      // put.add

      // TODO : debug print
      // System.out.println("".format(
      //    "sensor id : %s,  timestamp : %d,  rev-timestamp : %d, temp : %f,  humidity : %f", sensorId,
      //    timestamp, reverseTimeStamp, temperature, humidity));
      try {
        // TODO : save the data
        // htable.put(....)
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
    long t2 = System.currentTimeMillis();
    System.out.println("inserted " + total + " records  in " + (t2 - t1)
        + " ms");

    htable.close();
  }
}
