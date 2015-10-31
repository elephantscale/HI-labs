package hi.hbase;

import java.util.Random;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.util.Bytes;

/*
 * HBase JavaDocs :
 * http://hbase.apache.org/0.94/apidocs/index.html?overview-summary.html
 *
 * before running this, create 'MYNAME_users' table 
 * (replace MYNAME with your username)
 *
 * in hbase shell: 
 * 	> create 'MYNAME_users', 'info'
 */
public class Query {
	// / TODO 1 : update tablename
	static String tableName = "<your name>_users";
	static String familyName = "info";

	public static void main(String[] args) throws Exception {
		Configuration config = HBaseConfiguration.create();
		HTable htable = new HTable(config, tableName);

		// / TODO 2 : enter rowkey
		{
			String userId = "???";
			System.out.println("### querying for userId : " + userId);
			byte[] key = Bytes.toBytes(userId);

			Get get = new Get(key);

			long t1 = System.currentTimeMillis();
			Result result = htable.get(get);
			long t2 = System.currentTimeMillis();
			
			System.out.println("query took  " + (t2 - t1) + " ms");
			if (result != null) {
				KeyValue kv = result.getColumnLatest(Bytes.toBytes("info"),
						Bytes.toBytes("email"));
				if (kv != null) {
					byte[] value = kv.getValue();
					String email = new String(value);
					System.out.println("    email is : " + email);
				} else {
					System.out.println("kv is null");
				}

			} else {
				System.out.println("Result is null");
			}
		}

		// / TODO 3 : BONUS LAB
		// we are going to query for random userids (user-10, user-99 ...etc)
		/*
		int total = 100;
		Random rand = new Random();
		for (int i = 0; i < 10; i++) {
			int randomId = rand.nextInt(total * 2);
			String userId = "user-" + randomId;
			System.out.println("### querying for userId : " + userId);

			byte[] key = Bytes.toBytes(userId);
			Get get = new Get(key);
			long t1 = System.currentTimeMillis();
			Result result = htable.get(get);
			long t2 = System.currentTimeMillis();
			if (result != null) {
				KeyValue kv = result.getColumnLatest(Bytes.toBytes("info"),
						Bytes.toBytes("email"));
				if (kv != null) {
					byte[] value = kv.getValue();
					String email = new String(value);
					System.out.println("    email is : " + email);
				} else {
					System.out.println("kv is null");
				}

			} else {
				System.out.println("Result is null");
			}

			System.out.println("###     query time : " + (t2 - t1) + " ms\n");
		}
		*/
	}

}
