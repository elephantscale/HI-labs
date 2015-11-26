package hi.hbase;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.HTable;

/**
 * before running this, create 'MYNAME_users' table 
 * (replace MYNAME with  your username) 
 * 
 * in hbase shell: 
*      create 'MYNAME_users', 'info'
 */
public class Connect {

  public static void main(String[] args) throws Exception {
    Configuration config = HBaseConfiguration.create();
    HTable htable = new HTable(config, "MYNAME_users");     // TODO : change table name
    System.out.println ("### connected to " + htable.getTableDescriptor().getNameAsString());
    htable.close();
  }

}
