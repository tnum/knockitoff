set :environment, 'development'
set :output, {
 :error    => "/Users/kamalpasha/Documents/rails/knockitoff/log/error.log",
 :standard => "/Users/kamalpasha/Documents/rails/knockitoff/log/cron.log"
}

every 1.minute do
  rake "delete_old_items"
end
