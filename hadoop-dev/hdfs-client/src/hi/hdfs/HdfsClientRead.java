package hi.hdfs;

import java.io.InputStream;
import java.net.URI;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;

public class HdfsClientRead {
	public static void main(String[] args) throws Exception {
		if (args.length != 1) {
			System.out.println("Usage: hi.hdfs.HdfsClientRead <hdfs_input_path>");
			System.exit(1);
		}
		String fromHdfsFile = args[0];
		Configuration conf = new Configuration();
		// TODO prepare a FileSystem object using URI.create
		FileSystem fileSystem = null;
		
		Path path = new Path(fromHdfsFile);
		if (!fileSystem.exists(path)) {
			System.out.println("File " + fromHdfsFile + " does not exist");
			return;
		}
		InputStream in = null;
		try {
			in = fileSystem.open(path);
			// TODO write to System.out using IOUtils.copyBytes
		} finally {
			IOUtils.closeStream(in);
		}
	}
}
