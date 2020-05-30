require 'ffaker'
require 'faker'

%w[
  users
  items
  looks
  orders
].each do |file|
  require __dir__ + "/data/#{file}.rb"
end

# create_users
# create_items
# create_looks
# create_orders
