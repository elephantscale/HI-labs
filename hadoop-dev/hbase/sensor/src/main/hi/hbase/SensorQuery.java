package hi.hbase;

import java.util.Date;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.util.Bytes;

/**
 * HBase JavaDocs :
 * http://hbase.apache.org/0.94/apidocs/index.html?overview-summary.html
 *
 * Javadocs : http://docs.oracle.com/javase/7/docs/api/
 *
 * before running this, create '<yourname>_sensors' table (replace <yourname> with
 * your username) in hbase shell: create '<yourname>_sensors', 'd'
 */
public class SensorQuery  {
  // TODO : update tablename
  static String tableName = "<your name>_sensors";
  static String familyName = "d";

  public static void main(String[] args) throws Exception {

    if (args.length != 1) {
      System.out.println("missing sensor id");
      System.exit(1);
    }
    // TODO : convert input argument to sensorID
    // int sensorId = Integer.parseInt(....);

    Configuration config = HBaseConfiguration.create();

    // TODO : create an htable
    // HTable htable = new HTable(...);

    // TODO : figure start / end rows for scan
    /// our rowkey = sensorId + timestamp
    /// startRow = sensorId + 0 for timestamp
    /// end row  = sensorId +  Long.MAX_VALUE

    // byte[] startRow = Bytes.add(.....);
    // byte[] endRow = Bytes.add(...);

    // TODO : create a scan with start / end boundaries
    // Scan scan = new Scan(...);
    // ResultScanner scanner = ....
    int recordCount = 0;

    try {
    // TODO : iterate through scanner
    //  for (Result result : scanner) {

    //    byte [] rowKey = result... // extract row
    /// extract timestamp from rowkey (sensorID + reverseTimestamp)
    // long reverseTimestamp = Bytes.toLong(rowKey, Bytes.SIZEOF_INT); // offset into rowkey
    // long timestamp = ...;  // TODO : calculate actual timestamp

    /// TODO : extract temperature from KV
    //  KeyValue kv = result.getColumnLatest(Bytes.toBytes(familyName),  Bytes.toBytes("temp"));
    //     float temperature = ...
    //     System.out.println ("sensorId : " + sensorId + ", timestamp : " + new Date(timestamp) + ", temp : " + temperature);
    //  }
    } catch (Exception ex) {
      ex.printStackTrace();
    } finally {
      // TODO : close connections cleanly
      // scanner.close();
      // htable.close();
    }


  }

}
