package hi.mr;

import org.apache.hadoop.mapred.Counters;
import org.apache.hadoop.mapred.JobClient;
import org.apache.hadoop.mapred.JobID;
import org.apache.hadoop.mapred.RunningJob;

// from http://lintool.github.io/Cloud9/docs/content/counters.html
public class PrintCounters
{
    public static void main(String[] args) throws Exception
    {
        if (args.length != 1)
        {
            System.out.println ("Usage : java PrintCounters <job id>");
            System.exit(1);
        }
        RunningJob job = new JobClient().getJob(JobID.forName(args[0]));
//        RunningJob job = new JobClient().getJob(new JobID("job_201309211454", 9));
//        RunningJob job = new JobClient().getJob(args[0]);
        Counters counters = job.getCounters();
        for (Counters.Group group : counters) {
            System.out.println("- Counter Group: " + group.getDisplayName() + " (" + group.getName() + ")");
            System.out.println("  number of counters in this group: " + group.size());
            for (Counters.Counter counter : group) {
                System.out.println("  - " + counter.getDisplayName() + ": " + counter.getName());
            }
        }

    }


}
