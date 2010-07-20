# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :username => 'admin', :email => 'admin@root.com', :password => '9487oy', :password_confirmation => '9487oy', :role => 'admin'
puts 'New user created: ' << user.email

type1 = Type.create! :title => 'Visual Arts'
puts 'New type created: ' << type1.title
type2 = Type.create! :title => 'Music'
puts 'New type created: ' << type2.title
type3 = Type.create! :title => 'Performance/Video'
puts 'New type created: ' << type3.title
type4 = Type.create! :title => 'Literary'
puts 'New type created: ' << type4.title