REGISTER 'datafu-1.2.0.jar'

define SessionCount datafu.pig.sessions.SessionCount('10m');

pv = LOAD 'sujee/pv/in/pv-sample.csv' USING PigStorage(',') AS (timestamp:long, userId:int, url:chararray);
-- DUMP pv;

pv_sessionized = FOREACH (GROUP pv BY (userId,url)) {
    ordered = ORDER pv BY timestamp;
    GENERATE group.userId as userId,
             group.url as url,
             FLATTEN(SessionCount(ordered.timestamp)) as count;
}

DUMP pv_sessionized;

pv_sum = FOREACH (GROUP pv_sessionized ALL)
 GENERATE SUM(pv_sessionized.count) as total_pvs;

DUMP pv_sum;
