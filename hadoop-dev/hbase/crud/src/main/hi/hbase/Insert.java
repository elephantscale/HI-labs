package hi.hbase;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.util.Bytes;


/**
 * before running this, create '<yourname>_users' table
 * (replace <yourname> with your username)
 * in hbase shell:
 *      create '<yourname>_users', 'info'
 */
public class Insert
{

    // TODO : update the table name with your username
    static String tableName = "<your_name>_users";
    static String familyName = "info";

    public static void main(String[] args) throws Exception
    {
        Configuration config = HBaseConfiguration.create();

        // TODO : create new HTable instance
        HTable htable = null;

        int total = 100;
        long t1 = System.currentTimeMillis();
        for (int i=0; i < total ; i++)
        {
            String userid = "user-" + i;
            String email = "user-" + i + "@foo.com";
            String phone = "555-1234";

            // TODO : create a key from userid
            // byte [] key = Bytes.toBytes(???);

            // TODO : create a Put from key
            // Put put = new Put (key);

            // TODO : the following  user attributes to table
            // use put.add (family, column_qualifier, value) method
            // don't forget use Bytes.toBytes() to covert every thing to bytes

            // TODO : finally add it to htable
            //htable.put(???);

        }
        long t2 = System.currentTimeMillis();
        System.out.println ("### inserted " + total + " users  in " + (t2-t1) + " ms");

        // TODO : close the htable
    }

}
