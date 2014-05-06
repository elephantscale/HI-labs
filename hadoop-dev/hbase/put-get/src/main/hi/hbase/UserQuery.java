package hi.hbase;

import java.util.Random;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.util.Bytes;

/**
 * HBase JavaDocs :
 * http://hbase.apache.org/0.94/apidocs/index.html?overview-summary.html
 *
 * before running this, create '<yourname>_users' table (replace <yourname> with
 * your username) in hbase shell: create '<yourname>_users', 'info'
 */
public class UserQuery {
  // TODO : update tablename
  static String tableName = "<your name>_users";
  static String familyName = "info";

  public static void main(String[] args) throws Exception {
    Configuration config = HBaseConfiguration.create();
    HTable htable = new HTable(config, tableName);

    // we are going to query for random userids (user-10, user-99 ...etc)
    int total = 100;
    Random rand = new Random();
    for (int i = 0; i < 10; i++) {
      int randomId = rand.nextInt(total * 2);
      String userId = "user-" + randomId;
      System.out.println("querying for userId : " + userId);

      // TODO : convert the userId to bytes
      // byte [] key = ....

      // TODO : create a Get object with key
      long t1 = System.nanoTime();
      // Get get = ....
      long t2 = System.nanoTime();
      Result result = null;
      // TODO : get a Result using htable.get()
      // result = .....

      // TODO : check if result is null or empty
      if (result == null /* || () */) {
        // first check, this row may not exist
        System.out.println("     not found");
      } else {
        KeyValue kv = null;
        // TODO : get a KeyValue using result.getColumn.... () method
        // kv = .....
        // remember, to convert all values to bytes
        if (kv == null) {
          // even if row exist, this column may not exist
          System.out.println("     column 'email' not found");
        } else {
          // found value
          // TODO : retrieve email from KeyValue
          String email = null;
          // email = ....
          System.out.println("     email=" + email);
        }
      }
      // TODO : lets see how long the query time is
      // Q : is this time correct?
      System.out
          .println("     query time : " + (t2 - t1) / 1000000.0 + " ms\n");
    }
  }

}
