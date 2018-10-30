killall mongod
killall mongod

sleep 5

rm -rf ~/percona/rs1_1
rm -rf ~/percona/rs1_2
rm -rf ~/percona/rs1_3/

mkdir ~/percona/rs1_1/ ~/percona/rs1_2/ ~/percona/rs1_3/

sleep 1

cp -R ~/percona/single_instance/* ~/percona/rs1_1/

chmod +x ~/percona/PL18/config_files/prepare.sh
~/percona/PL18/config_files/prepare.sh
mkdir ~/percona/PL18/config_files/replaced
mv ~/percona/PL18/config_files/replicaset/*.cfg ~/percona/PL18/config_files/replaced/

~/percona/mongo/mongod -f ~/percona/PL18/config_files/replaced/rs11.cfg
~/percona/mongo/mongod -f ~/percona/PL18/config_files/replaced/rs12.cfg
~/percona/mongo/mongod -f ~/percona/PL18/config_files/replaced/rs13.cfg
~/percona/mongo/mongo --port 27010
