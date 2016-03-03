package hi.hbase;

import java.util.ArrayList;
import java.util.List;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.util.Bytes;

/*
 * before running this, create 'MYNAME_users' table 
 * (replace MYNAME with your username)
 *
 * in hbase shell: 
 * 	> create 'MYNAME_users', 'info'
 */
public class Insert {

	/// TODO 1 : update the table name with your username
	static String tableName = "MYNAME_users";
	static String familyName = "info";

	public static void main(String[] args) throws Exception {
		Configuration config = HBaseConfiguration.create();
		HTable htable = new HTable(config, tableName);

		int numUsers = 0;

		// write user 1
		{
			byte[] key1 = Bytes.toBytes("user1");
			Put put1 = new Put(key1);
			put1.add(Bytes.toBytes("info"), Bytes.toBytes("email"),
					Bytes.toBytes("user1@gmail.com"));
			/// TODO 2 : now add phone number as a coulumn
			// put1.add(???, ???, ???);

			// finally put this into table
			long t1 = System.currentTimeMillis();
			htable.put(put1);
			numUsers++;
			long t2 = System.currentTimeMillis();
			System.out.println("### Inserted user1 in " + (t2 - t1) + " ms");
		}

		/// TODO 3 : add another user
		/*
		{
		byte[] key2 = Bytes.toBytes("user2");
		Put put2 = ....
		put2.add(....)
		put2.add(???, ???, ???);
		numUsers++;
		}
		  
		 */

		/// BONUS LAB : add a few users
		/// we are inserting them in batch
		int total = 100;
		List<Put> batch = new ArrayList<Put>(); // list of puts
		for (int i = 0; i < total; i++) {
			String userid = "user-" + i;
			String email = userid + "@foo.com";
			String phone = "555-1234";

			byte[] key = Bytes.toBytes(userid);
			Put put = new Put(key);
			put.add(Bytes.toBytes("info"), Bytes.toBytes("email"),
					Bytes.toBytes(email));
			put.add(Bytes.toBytes("info"), Bytes.toBytes("phone"),
					Bytes.toBytes(phone));

			/// TODO : add the new put into the list
			batch.add(put);

			System.out.println("### added " + userid);
			numUsers++;
		}
		long t1 = System.currentTimeMillis();
		htable.put(batch);
		long t2 = System.currentTimeMillis();
		System.out.println("### inserted " + numUsers + " users  in " + (t2 - t1)
				+ " ms");

		htable.close();
	}

}
