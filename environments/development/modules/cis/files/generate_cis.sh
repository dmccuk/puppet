#!/bin/bash

# Generate CIS report
cd /root
wget --quiet http://<server.test>/pub/CIS/CIS_Red_Hat_Enterprise_Linux_cat_Benchmark-with-java_x64.tgz
tar zxf CIS_Red_Hat_Enterprise_Linux_cat_Benchmark-with-java_x64.tgz
#cd /root/CIS_Red_Hat_Enterprise_Linux_cat_Benchmark-with-java_x64
#/root/CIS_Red_Hat_Enterprise_Linux_cat_Benchmark-with-java_x64/jre-openjdk-1.7.0.25.x86_64/bin/java -Xmx512M -jar CISCAT.jar --accept-terms --results-dir /root/ --benchmark /root/CIS_Red_Hat_Enterprise_Linux_cat_Benchmark-with-java_x64/benchmarks/CIS_Red_Hat_Enterprise_Linux_6_Benchmark_v1.2.0.xml

# SCP the report
#for i in `ls -alrt /root | grep tdi | tail -1|awk '{print $9}'`; do scp /root/$i <server.test>:/var/www/html/pub/CIS_RESULTS; done
# visit https://<server.test>/pub/CIS_RESULTS/

