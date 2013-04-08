package hi.hdfs;

import java.io.BufferedReader;
import java.io.FileReader;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

public class HdfsClientAnswer {
	public static void main(String[] args) throws Exception {
		if (args.length != 2) {
			System.out.println("Usage: hi.hdfs.HdfsClient <local_input_path> <hdfs_output_path>");
			System.exit(1);
		}
		String fromLocalFile = args[0];
		String toHdfsFile = args[1];

		Configuration conf = new Configuration();
		FileSystem fileSystem = FileSystem.get(conf);
		// Check if the file already exists
		Path path = new Path(toHdfsFile);
		if (fileSystem.exists(path)) {
			System.out.println("File " + toHdfsFile + " already exists");
			return;
		}
		// Create a new file and write data to it.
		FSDataOutputStream out = fileSystem.create(path);
		BufferedReader in = new BufferedReader(new FileReader(fromLocalFile));

		String line;
		while ((line = in.readLine()) != null) {
			out.write(line.getBytes());
		}
		// Close all the file streams and file system
		in.close();
		out.close();
		fileSystem.close();
	}
}
