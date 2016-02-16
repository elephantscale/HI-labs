This lab teaches the use of Fair Scheduler
----

== STEP 1)  Open the scheduler UI
 http://<resource-manager>:8088/cluster/scheduler
  
  == STEP 2) Prepare to run multiple jobs in separate monitor windows

  For example, you can use the Hadoop example calculating the number PI, since it is long-running

  Give each job a different name, using -D mapreduce.job.name = <yourname>-job1 (for example)
  Submit the jobs to different queues, using -D mapreduce.job.queuename = <yourname>-queue1 (for example)

  Observe the jobs running in different pools, try to manipulate job execution by changing parameters 
  (but be mindful of other students on the same cluster)

