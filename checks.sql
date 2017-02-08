# Workshop MySQL Group Replication
# For demo purpose only, DO NOT USE IN PRODUCTION !

-- Check Instance configuration
SELECT concat('Check Instance configuration on ', @@server_id);
SHOW GLOBAL VARIABLES WHERE Variable_name IN ('server_id', 'log_bin', 'binlog_format', 'gtid_mode', 'enforce_gtid_consistency', 'log_slave_updates', 'master_info_repository', 'relay_log_info_repository','transaction_write_set_extraction', 'binlog_checksum');


-- Check Recovery configuration
SELECT concat('Check Recovery configuration on ', @@server_id);
SELECT user_name, host, user_password FROM mysql.slave_master_info WHERE channel_name = 'group_replication_recovery';
SHOW GRANTS FOR gr_user@'%';


-- Check Group Replication configuration
SELECT concat('Check Group Replication configuration on ', @@server_id); 
SHOW GLOBAL VARIABLES WHERE Variable_name IN ('group_replication_bootstrap_group', 'group_replication_group_name', 'group_replication_group_seeds', 'group_replication_local_address','group_replication_start_on_boot', 'group_replication_single_primary_mode', 'server_uuid');


-- Check Group Replication plugin
SELECT concat('Check Group Replication plugin on ', @@server_id); 
SELECT PLUGIN_NAME, PLUGIN_VERSION, PLUGIN_STATUS FROM information_schema.PLUGINS WHERE PLUGIN_NAME = 'group_replication';

