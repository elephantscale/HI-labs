package hi.hbase;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.util.Bytes;

public class UserScan
{
    static String tableName = "users";
    static String familyName = "info";

    public static void main(String[] args) throws Exception
    {
        if (args.length != 1)
        {
            System.out.println("missing user_id");
            System.exit(1);
        }

        int customerId = Integer.parseInt(args[0]);

        Configuration config = HBaseConfiguration.create();
        HTable htable = new HTable(config, tableName);

        // we only want to scan for a particular customer_id
        // this is the first part of rowkey
        // the second part of the key is revese timestamp
        // so we want to grab all the rows from
        // (customer_id + 0) to (customer_id + 999999....)
        // key = customer_id (INT) + reverse timestamp (LONG)
        byte[] startRow = Bytes.add(Bytes.toBytes(customerId), Bytes.toBytes(0L));
        // ^^ note the L to make zero LONG
        byte[] endRow = Bytes.add(Bytes.toBytes(customerId), Bytes.toBytes(Long.MAX_VALUE));

        Map<String, Integer> eventMap = new HashMap<String, Integer>();
        byte[] costColumn = Bytes.toBytes("cost");
        byte[] familyCF = Bytes.toBytes(familyName);

        Scan scan = new Scan(startRow, endRow);
        ResultScanner scanner = htable.getScanner(scan);
        int recordCount = 0;
        int totalCost = 0;
        long t1 = System.nanoTime();
        try
        {
            for (Result rr : scanner)
            {
                recordCount++;
                KeyValue kv = rr.getColumnLatest(familyCF, costColumn);
                if (kv != null)
                {
                    int cost = Bytes.toInt(kv.getValue());
                    totalCost += cost;
                }
            }
        } catch (Exception ex)
        {
            ex.printStackTrace();
        } finally
        {
            scanner.close();
        }
        long t2 = System.nanoTime();
        htable.close();

        System.out
                .println("customer: " + customerId + ",  record_count: " + recordCount + ", total_cost: " + totalCost);
        System.out.println("query time : " + (t2 - t1) / 1000000.0 + " ms\n");
    }
}
