killall mongod
killall mongod

sleep 5

rm -rf ~/percona/rs1_1
rm -rf ~/percona/rs1_2
rm -rf ~/percona/rs1_3/

mkdir ~/percona/rs1_1/ ~/percona/rs1_2/ ~/percona/rs1_3/

sleep 1

cp -R ~/percona/single_instance/* ~/percona/rs1_1/

~/percona/mongo/mongod --dbpath ~/percona/rs1_1/ \
  --logpath ~/percona/rs1_1/log.log --bind_ip 127.0.0.1 \
  --wiredTigerCacheSizeGB 0.3 --fork --auth --port 27010 --replSet rs1

~/percona/mongo/mongod --dbpath ~/percona/rs1_2/ \
  --logpath ~/percona/rs1_2/log.log --bind_ip 127.0.0.1 \
  --wiredTigerCacheSizeGB 0.3 --fork --auth --port 27011 --replSet rs1

~/percona/mongo/mongod --dbpath ~/percona/rs1_3/ \
  --logpath ~/percona/rs1_3/log.log --bind_ip 127.0.0.1 \
  --wiredTigerCacheSizeGB 0.3 --fork --auth --port 27012 --replSet rs1

~/percona/mongo/mongo --port 27010
