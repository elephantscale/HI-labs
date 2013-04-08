package hi.hdfs;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

public class HdfsClient {
	public static void main(String argv[]) {
		HdfsClient instance = new HdfsClient();
		String fromLocalFile = argv[0];
		String toHdfsFile = argv[1];
		try {
			instance.copyToHdfs(fromLocalFile, toHdfsFile);
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

	private void copyToHdfs(String fromLocalFile, String toHdfsFile)
			throws IOException {
		Configuration conf = new Configuration();
		conf.addResource(new Path("/usr/lib/hadoop/conf/core-site.xml"));
		conf.addResource(new Path("/usr/lib/hadoop/conf/hdfs-site.xml"));
		conf.addResource(new Path("/usr/lib/hadoop/conf/mapred-site.xml"));
		FileSystem fileSystem = FileSystem.get(conf);
		// Check if the file already exists
		Path path = new Path(toHdfsFile);
		if (fileSystem.exists(path)) {
			System.out.println("File " + toHdfsFile + " already exists");
			return;
		}
		// Create a new file and write data to it.
		FSDataOutputStream out = fileSystem.create(path);
		InputStream in = new BufferedInputStream(new FileInputStream(new File(
				fromLocalFile)));

		byte[] buffer = new byte[1024];
		int numBytes = 0;
		while ((numBytes = in.read(buffer)) > 0) {
			out.write(buffer, 0, numBytes);
		}
		// Close all the file streams and file system
		in.close();
		out.close();
		fileSystem.close();
	}
}
