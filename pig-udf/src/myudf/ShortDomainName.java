package myudf;

import java.io.IOException;
import java.util.Calendar;

import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;

public class ShortDomainName extends EvalFunc<String> {
	Calendar calendar = Calendar.getInstance();

	@Override
	public String exec(Tuple input) throws IOException {
	    // return type 'String' matches  <String>  in EvalFunc
	    // so pig knows what type of data to expect

	    // sanity check
		if ((input == null) || (input.size() == 0) || (input.get(0) == null) )
			return null;

		String domain = "";

		try {
		    domain = (String) input.get(0);
		    //log.info("got domain: " + domain); // using built in log function
		    System.out.println("got domain: " + domain);

		    // now to the real work
		    // extract the first word of domain name
		    // facebook.com --> facebook
		    // bbc.co.uk  --> bbc

		    // how?

		} catch (Exception e) {
			throw new IOException(e);
		}

		return domain;
	}
}
