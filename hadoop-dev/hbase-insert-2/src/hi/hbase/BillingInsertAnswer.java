package hi.hbase;


import java.io.BufferedReader;
import java.io.FileReader;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.util.Bytes;


/**
 * before running this program, create 'billing' table
 * in hbase shell:
 *      create '<your name>_billing', 'info'
 */
public class BillingInsertAnswer
{

    // TODO : replace <yourname> with your username
    static String tableName = "<your name>_billing";
    static String familyName = "info";

    public static void main(String[] args) throws Exception
    {

        if (args.length < 1)
        {
            System.out.println("usage : LogInsert <input files>");
            System.exit(1);
        }

        for (String file : args)
        {
            insertBillingData(file);
        }

    }

    private static void insertBillingData(String file) throws Exception
    {
        Configuration config = HBaseConfiguration.create();
        HTable htable = new HTable(config, tableName);
        // htable.setAutoFlush(false); // PERF
        // htable.setWriteBufferSize(1024*1024*12); // 12M; PERF
        long t1 = System.currentTimeMillis();
        BufferedReader reader = new BufferedReader(new FileReader(file));
        String line = null;
        long count = 0;
        while ( (line = reader.readLine()) != null)
        {
            count ++;
           String [] tokens = line.split(",");
           if (tokens.length == 5)
           {
               String timestampStr = tokens[0].trim();
               String userIdStr = tokens[1].trim();
               String resourceIdStr = tokens[2].trim();
               String qtyStr = tokens[3].trim();
               String costStr = tokens[4].trim();

               int userId = Integer.parseInt(userIdStr);
               int cost = Integer.parseInt(costStr);
               long timestamp = Long.parseLong(timestampStr);
               long reverseTS = Long.MAX_VALUE - timestamp;

               byte [] rowkey = Bytes.add(Bytes.toBytes(userId), Bytes.toBytes(reverseTS));

               Put put = new Put(rowkey);
               put.add(Bytes.toBytes(familyName), Bytes.toBytes("time"), Bytes.toBytes(timestamp));
               put.add(Bytes.toBytes(familyName), Bytes.toBytes("resource"), Bytes.toBytes(resourceIdStr));
               put.add(Bytes.toBytes(familyName), Bytes.toBytes("qty"), Bytes.toBytes(qtyStr));
               put.add(Bytes.toBytes(familyName), Bytes.toBytes("cost"), Bytes.toBytes(cost));

               htable.put(put);
           }
        }
        long t2 = System.currentTimeMillis();
        System.out.println ("inserted " + count + " billing records  in " + (t2-t1) + " ms");
        htable.close();
    }

}
