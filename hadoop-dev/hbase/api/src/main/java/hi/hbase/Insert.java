package hi.hbase;

import java.util.ArrayList;
import java.util.List;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.util.Bytes;

/*
 * before running this, create '<yourname>_users' table (replace <yourname> with
 * your username) 
 * in hbase shell: 
 * 	> create '<yourname>_users', 'info'
 */
public class Insert {

	/// TODO 1 : update the table name with your username
	static String tableName = "<your_name>_users";
	static String familyName = "info";

	public static void main(String[] args) throws Exception {
		Configuration config = HBaseConfiguration.create();
		HTable htable = new HTable(config, tableName);

		// write user 1
		{
			String user1 = "user1";
			String email1 = "user1@gmail.com";
			String phone1 = "555-1234";
			byte[] key1 = Bytes.toBytes(user1);
			Put put1 = new Put(key1);
			put1.add(Bytes.toBytes("info"), Bytes.toBytes("email"),
					Bytes.toBytes(email1));
			/// TODO 2 : now add phone number as a coulumn
			// put1.add(???, ???, ???);

			// finally put this into table
			long t1 = System.currentTimeMillis();
			htable.put(put1);
			long t2 = System.currentTimeMillis();
			System.out.println("### Inserted " + user1 + " in " + (t2 - t1) + " ms");
		}

		/// TODO 3 : add another user
		/*
		{
		String user2 = "user2";
		String email2 = "user2@gmail.com";
		String phone2 = "555-1234";
		byte[] key2 = Bytes.toBytes(user2);
		Put put2 = ....
		put2.add(....)
		put2.add(???, ???, ???);
		}
		  
		 */

		/// BONUS LAB : add a few users
		/// we are inserting them in batch
		int total = 100;
		List<Put> puts = new ArrayList<Put>(); // list of puts
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

			System.out.println("### added " + userid);

			/// TODO : add the new put into the list
			// puts.add(???);
		}
		long t1 = System.currentTimeMillis();
		htable.put(puts);
		long t2 = System.currentTimeMillis();
		System.out.println("### inserted " + total + " users  in " + (t2 - t1)
				+ " ms");

		htable.close();
	}

}
