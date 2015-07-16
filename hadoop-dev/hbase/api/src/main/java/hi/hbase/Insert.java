package hi.hbase;

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

	// TODO 1 : update the table name with your username
	static String tableName = "<your_name>_users";
	static String familyName = "info";

	public static void main(String[] args) throws Exception {
		Configuration config = HBaseConfiguration.create();
		HTable htable = new HTable(config, tableName);

		// write user 1
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
		htable.put(put1);

		/// TODO 3 : add another user
		/*
		String user2 = "user2";
		String email2 = "user2@gmail.com";
		String phone2 = "555-1234";
		byte[] key2 = Bytes.toBytes(user2);
		Put put2 = ....
		put2.add(....)
		put2.add(???, ???, ???);
		  
		 */
		
		/// BONUS LAB : add a few users
		/*

		int total = 100;
		long t1 = System.currentTimeMillis();
		for (int i = 0; i < total; i++) {
			String userid = "user-" + i;
			String email = "user-" + i + "@foo.com";
			String phone = "555-1234";

			// TODO : create a key from userid
			// byte [] key = Bytes.toBytes(???);

			// TODO : create a Put from key
			// Put put = new Put (key);

			// TODO : the following user attributes to table
			// use put.add (family, column_qualifier, value) method
			// don't forget use Bytes.toBytes() to covert every thing to bytes

			// TODO : finally add it to htable
			// htable.put(???);

		}
		long t2 = System.currentTimeMillis();
		System.out.println("### inserted " + total + " users  in " + (t2 - t1)
				+ " ms");
		*/

		htable.close();
	}

}
