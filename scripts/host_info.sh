#!/bin/bash
psql_host=$1
port=$2
db_name=$3
user_name=$4
password=$5
lscpu_out=`lscpu`
#
get_hostname(){
  hostname=$(hostname -f)
}
get_cpunumber(){
  cpu_number=$(echo "$lscpu_out" | egrep "^CPU\(s\):" | awk  '{print $2}' | xargs)
}
get_lscpu(){
#pattern for grep
  pattern=$1
  value=$(echo "$lscpu_out)" | egrep "$pattern" | awk -F':' '{print $2}' | xargs)
  echo "value=$value"
}
get_cpuarchitecture(){
  get_lscpu "Architecture"
  cpu_architecture=$value
}
get_cpumodelname(){
  get_lscpu "Model name:"
  cpu_model=$value
}
get_cpumhz(){
  get_lscpu "CPU MHz"
  cpu_mhz=$(echo $value | sed s/.000//g )
}
get_L2cache(){
  get_lscpu "L2 cache"
  L2_cache=$(echo $value | sed s/K//g)
}
#Parsing 
get_hostname
get_cpunumber
get_cpuarchitecture
get_cpumodelname
get_cpumhz
get_L2cache
totalmem=$(vmstat --unit M | tail -1 | awk '{print $4}')
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

#Insert data into database
insert_stmnt=$(cat <<- END 
insert into host_info(hostname,cpu_number,cpu_architecture,cpu_model,cpu_mhz,L2_cache,total_mem,"timestamp") values('${hostname}',${cpu_number},'${cpu_architecture}','${cpu_model}',${cpu_mhz},${L2_cache},${totalmem},'${timestamp}');      
END)
# print the insert statement
echo $insert_stmnt

#Executing Insert statement
export PGPASSWORD=$password
psql -h $psql_host -p $port -U $user_name -d $db_name -c "$insert_stmnt"
sleep 1

host_id=`psql -h localhost -U postgres host_agent -c "select id from host_info where hostname = '$hostname'" | tail -3 | head -1 | xargs`
echo $host_id >  ~/host_id
cat ~/host_id 
