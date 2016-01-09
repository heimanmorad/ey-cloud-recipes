# Add one hash per cron job required
# Set the utility instance name to install each cron job on via instance_name

default[:custom_crons] = [{:name => "backup-s3-60-minutes", :time => "0 */1 * * *", :command => "cd /data/konimboil/current && RAILS_ENV=production bundle exec rake backup:run trigger='production-backup-s3-often-ey'", :instance_name => "cron"},
{:name => "Zap cron new", :time => "10 1,5,9,12,21 * * *", :command => "cd /data/konimboil/current && ./script/runner -e production 'Store.zap_cron'", :instance_name => "cron"},
{:name => "Store.more_zap_cron at 4am", :time => "10 18 * * *", :command => "cd /data/konimboil/current && ./script/runner -e production 'Store.more_zap_cron'", :instance_name => "cron"},
{:name => "Store.backup_stores at 7:20 am", :time => "20 21 * * *", :command => "cd /data/konimboil/current && ./script/runner -e production 'Store.backup_stores'", :instance_name => "cron"},
{:name => "backup-s3-1-day", :time => "30 20 * * *", :command => "cd /data/konimboil/current && RAILS_ENV=production bundle exec rake backup:run trigger='production-backup-s3-every-day-ey'", :instance_name => "cron"},
{:name => "Buy2.buy2_cron", :time => "30 4 * * *", :command => "cd /data/konimboil/current && ./script/runner -e production 'Buy2.buy2_cron'", :instance_name => "cron"}]
