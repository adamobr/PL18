killall mongod
killall mongod
killall mongos

sleep 5


chmod +x ~/percona/PL18/config_files/prepare.sh

#cleaning all
rm /home/adamo/percona/PL18/config_files/replaced -rf
cd ~/percona/PL18/config_files/shard
./clear.sh

cd ~/percona/PL18/config_files/replicaset/
./clear.sh
cd ~

~/percona/PL18/config_files/prepare.sh
mkdir ~/percona/PL18/config_files/replaced

#configs should be ok here
mv ~/percona/PL18/config_files/shard/*.cfg ~/percona/PL18/config_files/replaced/

~/percona/mongo/mongod -f ~/percona/PL18/config_files/replaced/rs11.cfg
~/percona/mongo/mongod -f ~/percona/PL18/config_files/replaced/rs12.cfg
~/percona/mongo/mongod -f ~/percona/PL18/config_files/replaced/rs13.cfg
~/percona/mongo/mongod -f ~/percona/PL18/config_files/replaced/rs21.cfg
~/percona/mongo/mongod -f ~/percona/PL18/config_files/replaced/rs22.cfg
~/percona/mongo/mongod -f ~/percona/PL18/config_files/replaced/rs23.cfg
~/percona/mongo/mongod -f ~/percona/PL18/config_files/replaced/srv_cfg.cfg

~/percona/mongo/mongo --port 27019 --eval "rs.initiate()"

sleep(10)
~/percona/mongo/mongos -f ~/percona/PL18/config_files/replaced/mongos.cfg

