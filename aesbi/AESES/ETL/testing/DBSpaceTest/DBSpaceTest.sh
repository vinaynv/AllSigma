cd /

df -h > /usr/local/data/bi_data/ETL/testing/DBSpaceTest/appServerDetails.txt

cd /usr/local/pentaho-bi-suite/pentaho-4.8/design-tools/data-integration	
./pan.sh -file=/usr/local/data/bi_data/ETL/testing/DBSpaceTest/DiskSpaceTest.ktr -level=Detailed > /usr/local/data/bi_data/logs/DiskSpaceTest.log


