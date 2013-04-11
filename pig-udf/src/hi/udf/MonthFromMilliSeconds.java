package hi.udf;

import java.io.IOException;
import java.util.Calendar;

import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;

public class MonthFromMilliSeconds extends EvalFunc<String> {
	Calendar calendar = Calendar.getInstance();

	// expects a long
	@Override
	public String exec(Tuple input) throws IOException {
		if ((input == null) || (input.size() == 0))
			return null;

		int month = 0;

//		System.out.println(input);
		try {
			long ts = (Long) input.get(0); // epoc time in ms
			calendar.setTimeInMillis(ts);
			month = calendar.get(Calendar.MONTH) + 1;
		} catch (Exception e) {
			throw new IOException(e);
		}

		return ""+month;
	}
}
