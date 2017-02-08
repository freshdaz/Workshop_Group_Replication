# Workshop MySQL Group Replication
# For demo purpose only, DO NOT USE IN PRODUCTION !

### MySQL Enterprise Backup (MEB)
### http://mysqlserverteam.com/creating-and-restoring-database-backups-with-mysqldump-and-mysql-enterprise-backup-part-2-of-2/

## It is recommended that a server is provisioned before it is added to a group. 
## That way, one minimizes the time spent on the recovery step.


# The minimum privileges for the MySQL user with which mysqlbackup connects to the server are: 

CREATE USER 'mysqlbackup'@'localhost' IDENTIFIED BY 'mysqlbackup';
GRANT RELOAD ON *.* TO 'mysqlbackup'@'localhost';
GRANT CREATE, INSERT, DROP, UPDATE ON mysql.backup_progress TO 'mysqlbackup'@'localhost';
GRANT CREATE, INSERT, SELECT, DROP, UPDATE ON mysql.backup_history TO 'mysqlbackup'@'localhost';
GRANT REPLICATION CLIENT ON *.* TO 'mysqlbackup'@'localhost';
GRANT SUPER ON *.* TO 'mysqlbackup'@'localhost';
GRANT PROCESS ON *.* TO 'mysqlbackup'@'localhost';

# Additional privileges are required for 
# 	using transportable tablespaces (TTS) to back up and restore InnoDB tables
# 	creating tape backups using the System Backup to Tape (SBT) API : 

GRANT LOCK TABLES, SELECT, CREATE, ALTER ON *.* TO 'mysqlbackup'@'localhost';
GRANT CREATE, INSERT, DROP, UPDATE ON mysql.backup_sbt_history TO 'mysqlbackup'@'localhost';


