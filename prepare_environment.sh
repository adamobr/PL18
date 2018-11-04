#prepare environment

cd ~
mkdir percona

cd percona
#single instance test
rm -rf single_instance && mkdir single_instance
#replicaset test
rm -rf rs1_1 rs1_2 rs1_3 rs1_arb && mkdir rs1_1 rs1_2 rs1_3 rs1_arb
#replicaset 2 test
rm -rf rs2_1 rs2_2 rs2_3 && mkdir rs2_1 rs2_2 rs2_3
#config and mongos files
rm -rf mongos_files mongoconfig && mkdir mongos_files mongoconfig
# Template files
rm -rf examples && mkdir examples
rm -rf mongo4
mkdir mongo4
rm -rf mongo

# downloading mongodb - you may need to find the best distro

uname -a | grep 'Darwin' 2>&1 >/dev/null
if [ $? -eq 0  ]
then 
  echo "Downloading Binaries for OSX"
  curl https://fastdl.mongodb.org/osx/mongodb-osx-ssl-x86_64-4.0.3.tgz -o mongodb-osx-ssl-x86_64-4.0.3.tgz
  
  echo -e "Decompressing downloads"
  gzip -d mongodb-osx-ssl-x86_64-4.0.3.tgz
  tar xf mongodb-osx-ssl-x86_64-4.0.3.tar -C ~/percona/mongo4 --strip-components=1
        
  echo "Cleaning up compressed files"
  rm mongodb-osx-ssl-x86_64-4.0.3.tar

else 
  
  echo "Downloading Binaries for Linux x86_64 generic"
  wget --help | grep show-progress > /dev/null 
  if [ "$?" -eq 0 ]
    then
    wget -q --show-progress https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-4.0.3.tgz
  else
    wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-4.0.3.tgz
  fi

  echo "Decompressing downloads"
  gzip -d mongodb-linux-x86_64-4.0.3.tgz
  tar xf mongodb-linux-x86_64-4.0.3.tar -C ~/percona/mongo4 --strip-components=1
   
  echo "Cleaning up compressed files"
  rm mongodb-linux-x86_64-4.0.3.tar      
fi

cd ~/percona

rm -rf mongo/ 
mv mongo4/bin mongo/
rm -rf mongo4/

MONGODBPATH=$(echo $PATH | grep percona/mongo)
if [ -z ${MONGODBPATH} ]; then 
  echo "setting path";
  export PATH=$PATH:/$HOME/percona/mongo; 
else 
  echo "Already in path"; 
fi
