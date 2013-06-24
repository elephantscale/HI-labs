package hi.hive;

/**
 *
 * @author mark
 */
import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.io.Text;

public final class CountWords extends UDF {

    public Text evaluate(final Text s) {
        if (s == null) {
            return null;
        }
        String line = s.toString();
        String[] words = line.split("\\W");
        return new Text(Integer.toString(words.length));
    }
}