package hi.udf;

import java.io.IOException;
import java.util.Calendar;

import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;

public class FullDateFromMilliSeconds extends EvalFunc<String> {
	Calendar calendar = Calendar.getInstance();

	// expects a long
	@Override
	public String exec(Tuple input) throws IOException {
		if ((input == null) || (input.size() == 0))
			return null;

		String date = "0000-00-00";

//		System.out.println(input);
		try {
			long ts = (Long) input.get(0); // epoc time in ms
			calendar.setTimeInMillis(ts);
			date = String.format("%d-%d-%d", calendar.get(Calendar.YEAR),
					calendar.get(Calendar.MONTH) + 1,
					calendar.get(Calendar.DAY_OF_MONTH));
		} catch (Exception e) {
			throw new IOException(e);
		}

		return date;
	}
}
