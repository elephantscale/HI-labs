package hi.hbase;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.HTable;

/**
 * before running this, create '<yourname>_users' table (replace <yourname> with
 * your username) in hbase shell: create '<yourname>_users', 'info'
 */
public class Connect {

  public static void main(String[] args) throws Exception {
    Configuration config = HBaseConfiguration.create();
    HTable htable = new HTable(config, "sujee_users");     // TODO : change table name
    System.out.println ("connected to " + htable.getTableDescriptor().getNameAsString());
    htable.close();
  }

}
