#! /bin/bash
psql_host=$1
port=$2
db_name=$3
user_name=$4
password=$5


get_cpuidel(){
  cpuidel=$( vmstat -t | tail -1 | awk '{print $ 15}' | xargs)
}
get_diskio(){
  diskio=$(vmstat -d | tail -1 | awk '{print $ 10}')
}
get_memoryfree(){
  memoryfree=$(vmstat --unit M | tail -1 | awk '{print $ 4}')
}
get_diskavaliable(){
  diskavaliable=$(df -BM |head -2 |tail -1| awk '{print $4}'| sed s/.$//)
}
get_cpukernel(){
  cpukernel=$(vmstat --unit M | tail -1 | awk '{print $14}')
}
#step 1: parse the data
get_cpuidel
get_diskio
get_memoryfree
get_diskavaliable
get_cpukernel
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

#step 2: Construct Insert statement
insert_stmnt=$(cat <<- END 
INSERT INTO PUBLIC.host_usage ("timestamp",memory_free,cpu_idel,cpu_kernel,disk_io,disk_avaliable) VALUES ('${timestamp}',${memoryfree},${cpuidel},${cpukernel},${diskio},${diskavaliable});
END
)
echo $insert_stmnt

#step 3: Execute insert statement
export PGPASSWORD=$password
psql -h $psql_host -p $port -U $user_name -d $db_name -c "$insert_stmnt"
sleep 1

 

