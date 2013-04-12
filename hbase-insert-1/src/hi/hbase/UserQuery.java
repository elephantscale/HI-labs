package hi.hbase;

import java.util.Random;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.util.Bytes;

public class UserQuery
{
    // TODO : substitute your username to <yourname> for the table name
    static String tableName = "<your name>_users";
    static String familyName = "info";

    public static void main(String[] args) throws Exception
    {
        Configuration config = HBaseConfiguration.create();
        HTable htable = new HTable(config, tableName);
        int total = 100;
        Random rand = new Random();
        for (int i=0; i < 10; i++)
        {
            int id = rand.nextInt(total * 2);
            System.out.println ("querying for userId : " + id);
            byte [] key = Bytes.toBytes(id);

            long t1 = System.nanoTime();
            Get get = new Get(key);
            long t2 = System.nanoTime();
            Result result = htable.get(get);
            if (result.isEmpty())
            {
                // first check, this row may not exist
                System.out.println ("     row user=" + id + " : not found");
            }
            else
            {
                byte [] family = Bytes.toBytes(familyName);
                byte [] emailCol = Bytes.toBytes("email");
                KeyValue kv = result.getColumnLatest(family, emailCol);
                if (kv == null)
                {
                    // even if row exist, this column may not exist
                    System.out.println ("     column 'email' not found");
                }
                else
                {
                    // found
                    byte [] value = kv.getValue();
                    String email = new String (value);
                    System.out.println ("     email=" + email );
                }
            }
            System.out.println ("     query time : " + (t2-t1)/1000000.0 + " ms\n");
        }
    }

}
