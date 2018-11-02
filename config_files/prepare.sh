cd ~/percona/PL18/config_files/replicaset
~/percona/PL18/config_files/replicaset/clear.sh
cd ~/percona/PL18/config_files/shard/
~/percona/PL18/config_files/shard/clear.sh
cd ~
sed -i.bkp "s|\$HOME|${HOME}|g" ~/percona/PL18/config_files/replicaset/*.cfg
sed -i.bkp "s|\$HOME|${HOME}|g" ~/percona/PL18/config_files/shard/*.cfg
