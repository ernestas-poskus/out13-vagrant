# --- Redis Setup ---------------------------------------------------------------
#
# @Provider: git://github.com/fsalum/puppet-redis
#

class install_redis($ip = '127.0.0.1') 
{
    class { 'redis':
      conf_bind       => $ip,
      conf_port       => "${redis_port}",
      conf_loglevel   => 'debug',
      package_ensure  => present,
      service_ensure  => 'running',
      service_enable  => true,
      conf_dir        => '/var/redis/'
    }
}


# https://github.com/fsalum/puppet-redis

# $package_ensure                   = 'present',
# $service_ensure                   = 'running',
# $service_enable                   = true,
# $conf_daemonize                   = 'yes',
# $conf_pidfile                     = UNSET,
# $conf_port                        = '6379',
# $conf_bind                        = '127.0.0.1',
# $conf_timeout                     = '0',
# $conf_loglevel                    = 'notice',
# $conf_logfile                     = UNSET,
# $conf_syslog_enabled              = UNSET,
# $conf_syslog_ident                = UNSET,
# $conf_syslog_facility             = UNSET,
# $conf_databases                   = '16',
# $conf_save                        = UNSET,
# $conf_nosave                      = UNSET,
# $conf_rdbcompression              = 'yes',
# $conf_dbfilename                  = 'dump.rdb',
# $conf_dir                         = '/var/lib/redis/',
# $conf_slaveof                     = UNSET,
# $conf_masterauth                  = UNSET,
# $conf_slave_server_stale_data     = 'yes',
# $conf_repl_ping_slave_period      = '10',
# $conf_repl_timeout                = '60',
# $conf_requirepass                 = UNSET,
# $conf_maxclients                  = UNSET,
# $conf_maxmemory                   = UNSET,
# $conf_maxmemory_policy            = UNSET,
# $conf_maxmemory_samples           = UNSET,
# $conf_appendonly                  = 'no',
# $conf_appendfilename              = UNSET,
# $conf_appendfsync                 = 'everysec',
# $conf_no_appendfsync_on_rewrite   = 'no',
# $conf_auto_aof_rewrite_percentage = '100',
# $conf_auto_aof_rewrite_min_size   = '64mb',
# $conf_slowlog_log_slower_than     = '10000',
# $conf_slowlog_max_len             = '1024',
# $conf_vm_enabled                  = 'no',
# $conf_vm_swap_file                = '/tmp/redis.swap',
# $conf_vm_max_memory               = '0',
# $conf_vm_page_size                = '32',
# $conf_vm_pages                    = '134217728',
# $conf_vm_max_threads              = '4',
# $conf_hash_max_zipmap_entries     = '512',
# $conf_hash_max_zipmap_value       = '64',
# $conf_list_max_ziplist_entries    = '512',
# $conf_list_max_ziplist_value      = '64',
# $conf_set_max_intset_entries      = '512',
# $conf_zset_max_ziplist_entries    = '128',
# $conf_zset_max_ziplist_value      = '64',
# $conf_activerehashing             = 'yes',
# $conf_include                     = UNSET,
# $conf_glueoutputbuf               = 'yes',