#!/bin/bash
sudo yum install java-11-amazon-corretto-headless
java -jar spring-petclinic*.jar > /dev/null 2 > /dev/null < /dev/null
#sh ./run.sh
exit 0