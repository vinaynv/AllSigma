cd /usr/local/pentaho_bi_suite/pentaho/design-tools/data-integration
Xvfb :1 -screen 0 800x600x24&
export DISPLAY=localhost:1.0
./kitchen.sh -file=/usr/local/data/bi_data/ETL/Production/Ancillary/SPP/DayAhead/job_m_ancillary_spp_dayahead_site_to_server.kjb -level=Detailed > /usr/local/data/bi_data/logs/job_m_ancillary_spp_dayahead_site_to_server.log