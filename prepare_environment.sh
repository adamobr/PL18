#prepare environment

cd ~

mkdir percona
cd percona
#single instance test
mkdir single_instance
#replicaset test
mkdir rs1_1 rs1_2 rs1_3
#replicaset 2 test
mkdir rs2_1 rs2_2 rs2_3
#config and mongos files
mkdir mongos_files mongoconfig
# Template files
mkdir examples


# downloading mongodb - you may need to find the best distro

wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-4.0.3.tgz
tar -xvzf mongodb-linux-x86_64-4.0.3.tgz
mv mongodb-linux-x86_64-4.0.3/bin/ mongo
rm mongodb-linux-x86_64-4.0.3 -rf 
rm mongodb-linux-x86_64-4.0.3.tgz

export PATH=$PATH:/$(pwd)/mongo
