package hi.hbase;

import java.io.IOException;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.hadoop.hbase.CoprocessorEnvironment;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.HConnection;
import org.apache.hadoop.hbase.client.HConnectionManager;
import org.apache.hadoop.hbase.client.HTableInterface;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.coprocessor.BaseRegionObserver;
import org.apache.hadoop.hbase.coprocessor.ObserverContext;
import org.apache.hadoop.hbase.coprocessor.RegionCoprocessorEnvironment;
import org.apache.hadoop.hbase.regionserver.wal.WALEdit;
import org.apache.hadoop.hbase.util.Bytes;

// this class will populate all secondary tables
public class MyCoProcessor extends BaseRegionObserver {

  HConnection hConnection;

  static byte[] table = Bytes.toBytes("<your name>_users_by_email"); // TODO : fix name
  static byte[] family = Bytes.toBytes("info");
  static byte[] colEmail = Bytes.toBytes("email");
  static byte[] colUserId = Bytes.toBytes("userId");

  private static final Log LOG = LogFactory.getLog(MyCoProcessor.class);

  @Override
  public void start(CoprocessorEnvironment env) throws IOException {
    this.hConnection = HConnectionManager.createConnection(env
        .getConfiguration());
    LOG.info("co processor MyCoProcessor starting...");
  }

  @Override
  public void postPut(ObserverContext<RegionCoprocessorEnvironment> e, Put put,
      WALEdit edit, boolean writeToWAL) throws IOException {

    LOG.info("in postPut");

    /// TODO : call insertToTable2 ()
  }

  public void insertToTable2(Put put) throws IOException {
    LOG.info("in insertToTable2");
    List<KeyValue> kv = put.get(family, colEmail);

    if (kv.size() > 0) {
      KeyValue kv2 = kv.get(0);
      if (kv2 != null) {
        /// TODO : extract email from kv2
        // byte[] emailValue = ...

        // LOG.info("  email : " + new String(emailValue));

        // grab userId from Put (original)
        // byte[] prevRowKey = ...

        /// TODO : create new Put using email as rowkey
        // Put newPut = new Put (...);
        // LOG.info("inserting newput into table2, key " + new String(emailValue));

        /// TODO : save the new put in table2
        // HTableInterface table = this.hConnection.getTable(family);
        // / TODO : be sure to test every thing before turning the following on
        // table.put(newPut);
      }
    }

  }

  @Override
  public void postDelete(ObserverContext<RegionCoprocessorEnvironment> e,
      Delete delete, WALEdit edit, boolean writeToWAL) throws IOException {
    // TODO Auto-generated method stub
  }


}
