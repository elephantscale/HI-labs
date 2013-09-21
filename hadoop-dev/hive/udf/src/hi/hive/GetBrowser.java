package hi.hive;

/**
 *
 * @author mark
 */
import eu.bitwalker.useragentutils.UserAgent;
import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.io.Text;

public final class GetBrowser extends UDF {

    public Text evaluate(final Text s) {
        if (s == null) {
            return null;
        }
        return new Text(UserAgent.parseUserAgentString(s.toString()).getBrowser().getName());
    }
}