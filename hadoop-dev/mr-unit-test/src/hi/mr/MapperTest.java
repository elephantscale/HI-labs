package hi.mr;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Counter;
import org.apache.hadoop.mapreduce.Mapper; // careful to select the new package
import org.apache.hadoop.mrunit.mapreduce.MapDriver; // careful to select the new package
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class MapperTest
{
    MapDriver<Object, Text, Text, IntWritable> mapDriver;

    @Before
    public void setup() throws Exception
    {
        Mapper<Object, Text, Text, IntWritable> mapper = new BillingPolished.MyMapper();
        this.mapDriver = MapDriver.newMapDriver();
        this.mapDriver.setMapper(mapper);
    }

    // @Test
    // public void nullRecord() throws Exception
    // {
    // this.mapDriver.setInput(new LongWritable(0), null);
    // this.mapDriver.runTest();
    // }

    @Test
    public void emptyRecord() throws Exception
    {
        this.mapDriver.setInput(new LongWritable(0), new Text(""));
        this.mapDriver.runTest();
    }

    @Test
    public void incompleteRecord1() throws Exception
    {
        // timestamp only
        this.mapDriver.setInput(new LongWritable(0), new Text("123"));
        this.mapDriver.runTest();
    }

    @Test
    public void incompleteRecord2() throws Exception
    {
        // timestamp+userid only
        this.mapDriver.setInput(new LongWritable(0), new Text("123,4"));
        this.mapDriver.runTest();
    }


    @Test
    public void valid1() throws Exception
    {
        this.mapDriver.setInput(new LongWritable(0), new Text("123,10,100,5,10"));
        this.mapDriver.addOutput(new Text("10"), new IntWritable(10));
        this.mapDriver.runTest();
    }

    @Test
    public void valid2() throws Exception
    {
        this.mapDriver.setInput(new LongWritable(0), new Text("123,10,100,5,0"));
        this.mapDriver.addOutput(new Text("10"), new IntWritable(0));
        this.mapDriver.runTest();
    }

    /*
    @Test
    public void counter() throws Exception
    {
        // TODO :create a bad record
        this.mapDriver.setInput(new LongWritable(0), new Text("???"));
        this.mapDriver.runTest();
        Counter badRecords = this.mapDriver.getCounters().findCounter("hi.mr.BillingPolished$MyMapper$Counters",
                "BAD_RECORDS");
        // TODO : assert
        // Assert.assertEquals(???, ???);
    }
    */

    // *********** PRIZE *****
    // can you think of any more tests?
    @Test
    public void invalidCost() throws Exception
    {
        this.mapDriver.setInput(new LongWritable(0), new Text("123,4,10,5,abc"));
        this.mapDriver.runTest();
    }

}
