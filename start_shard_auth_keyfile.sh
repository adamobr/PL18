killall mongod
killall mongod
killall mongos

sleep 5


chmod +x ~/percona/PL18/config_files/prepare.sh
~/percona/PL18/config_files/prepare.sh
mkdir ~/percona/PL18/config_files/replaced
mv ~/percona/PL18/config_files/shard/*.cfg ~/percona/PL18/config_files/replaced/

~/percona/mongo/mongod -f ~/percona/PL18/config_files/replaced/rs11.cfg
~/percona/mongo/mongod -f ~/percona/PL18/config_files/replaced/rs12.cfg
~/percona/mongo/mongod -f ~/percona/PL18/config_files/replaced/rs13.cfg
~/percona/mongo/mongod -f ~/percona/PL18/config_files/replaced/rs21.cfg
~/percona/mongo/mongod -f ~/percona/PL18/config_files/replaced/rs22.cfg
~/percona/mongo/mongod -f ~/percona/PL18/config_files/replaced/rs23.cfg

~/percona/mongo/mongo --port 27013
