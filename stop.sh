#!/bin/bash
cd /home/ec2-user/student3
echo "running the Java application now"
java -jar spring-petclinic*.jar > /dev/null 2> /dev/null < /dev/null &
#java -jar spring-petclinic*.jar &
echo "ran jar file in background"