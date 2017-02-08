# Workshop MySQL Group Replication
# For demo purpose only, DO NOT USE IN PRODUCTION !

-- Must be run on each node

-- Create recovery user
SET sql_log_bin=0;
 
CREATE USER gr_user@'%';
GRANT REPLICATION SLAVE ON *.* TO gr_user@'%' IDENTIFIED BY 'Mdp5uperS3cr&t';
FLUSH PRIVILEGES;
 
-- Create recovery channel
CHANGE MASTER TO MASTER_USER='gr_user', MASTER_PASSWORD='Mdp5uperS3cr&t' FOR CHANNEL 'group_replication_recovery';
 
SET sql_log_bin=1;
