# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Manager.create(:name => "manager", :email => "manager@website.com", :phone_number => 1111111111, :type => "Manager")
Manager.create(:name => "manager1", :email => "manager1@website.com", :phone_number => 2222222222, :type => "Manager")
Manager.create(:name => "manager2", :email => "manager2@website.com", :phone_number => 3333333333, :type => "Manager")
Manager.create(:name => "manager3", :email => "manager3@website.com", :phone_number => 4444444444, :type => "Manager")