## Requirements

- a DODAS IAM account member of EGI group
- Docker

## Submit your first job

Start the client container via:

```bash
$ docker run -ti dodas-ts/htclient
```

Follow the instructions.

```bash
oidc-keychain: Agent pid 21
No account exists with this short name. Creating new configuration ...
Generating account configuration ...
accepted

Using a browser on another device, visit:
https://dodas-iam.cloud.cnaf.infn.it/device

And enter the code: ASDSKKJ
```

When done, you should be prompted for an encryption password. Go ahead and insert one.

By now, you should be able to interact with the condor cluster like:

```bash
$ condor_q


-- Schedd: 131.154.96.169.myip.cloud.infn.it : <131.154.96.169:31618?... @ 09/12/22 09:44:05
OWNER BATCH_NAME      SUBMITTED   DONE   RUN    IDLE   HOLD  TOTAL JOB_IDS

Total for query: 0 jobs; 0 completed, 0 removed, 0 idle, 0 running, 0 held, 0 suspended 
Total for dciangot: 0 jobs; 0 completed, 0 removed, 0 idle, 0 running, 0 held, 0 suspended 
Total for all users: 0 jobs; 0 completed, 0 removed, 0 idle, 0 running, 0 held, 0 suspended
```


To submit your first condor job you should first edit the `/opt/workspace/htc-example/simple_job.sub` file, inserting your username where indicated.

Then you are ready to submit the job via:

```bash
cd htc-example
condor_submit -spool simple_job.sub
```

## Monitoring/Debugging jobs

```bash
# Check the status of the job in the queue
condor_q

# Check the cluster status
condor_status

# Check the job history
condor_history -h

# Retrieve the logs and the outputs
# you will download locally the remote files for simple.log, simple.out, simple.err
# as specified in the condor config
condor_transfer_data <PUT your jobID here>
```