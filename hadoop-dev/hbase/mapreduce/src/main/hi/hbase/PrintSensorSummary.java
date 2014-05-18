package hi.hbase;

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
 * before running this, create '<yourname>_sensor_summary' table (replace
 * <yourname> with your username) in hbase shell: create
 * '<yourname>_sensor_summary', 'd'
 */
public class PrintSensorSummary {
  // TODO : update tablename
  static String tableName = "sujee_sensor_summary";
  static String familyName = "d";

  public static void main(String[] args) throws Exception {

    Configuration config = HBaseConfiguration.create();

    // / TODO : scan the entire summary table and print out results

    // HTable htable = new HTable(config, tableName);
    // Scan scan = ...
    // ResultScanner scanner = htable.getScanner(scan);
    // for (Result result : scanner) {
  }
  // scanner.close();
  // htable.close();

}
