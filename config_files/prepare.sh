sed -i.bkp "s|\$HOME|${HOME}|g" ~/percona/PL18/config_files/replicaset/*.cfg
sed -i.bkp "s|\$HOME|${HOME}|g" ~/percona/PL18/config_files/shard/*.cfg
