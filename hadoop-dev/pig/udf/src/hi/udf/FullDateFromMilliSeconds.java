package hi.udf;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;

import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;

public class FullDateFromMilliSeconds extends EvalFunc<String> {
	Calendar calendar = Calendar.getInstance();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	// expects a long
	@Override
	public String exec(Tuple input) throws IOException {
		if ((input == null) || (input.size() == 0))
			return null;

		String date = "0000-00-00";

		// System.out.println(input);
		try {
			long ts = (Long) input.get(0); // epoc time in ms
			calendar.setTimeInMillis(ts);
            Date dt = new Date(ts);
            date = sdf.format(dt);
		} catch (Exception e) {
			throw new IOException(e);
		}

		return date;
	}
}
