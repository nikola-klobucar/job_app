# Dir[Rails.root.join('db/seeds/*.rb')].sort.each do |file|
#     puts "Processing #{file.split('/').last}"
#     require file
#     end

load 'db/seeds/user_seed.rb'
load 'db/seeds/ad_seed.rb'
load 'db/seeds/job_seed.rb'