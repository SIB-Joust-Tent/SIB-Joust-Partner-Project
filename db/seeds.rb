# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
password = 'JoustSIB13'
employees = User.create!([
	{name: 'Erich Sifert', position: 'CEO', password: password, password_confirmation: password, email: 'erichseifert@joust.io'}, 
	{name: 'Mike Lilly', position: 'CTO', password: password, password_confirmation: password, email: 'mikelilly@joust.io'}, 
	{name: 'Jeffrey Glusman', position: 'COO', password: password, password_confirmation: password, email: 'jeffreyglusman@joust.io'}, 
	{name: 'Eduardo Garcia Lopez', position: 'Java Wizard', password: password, password_confirmation: password, email: 'eglopez@joust.io'}, 
	{name: 'Vipul Jain', position: 'GWT Genie', password: password, password_confirmation: password, email: 'vjain@joust.io'}, 
	{name: 'Daniel Schultz', position: 'Professional Expert', password: password, password_confirmation: password, email: 'dschultz@joust.io'}, 
	{name: 'Alex Boerstler', position: 'Creative Director', password: password, password_confirmation: password, email: 'arboerstler@joust.io'}, 
	{name: 'Samantha Oliver', position: 'Content Strategist', password: password, password_confirmation: password, email: 'soliver@joust.io'}, 
	{name: 'Aysha Rafiq', position: 'Information Architect', password: password, password_confirmation: password, email: 'arafiq@joust.io'}, 
	{name: 'TJ Smith', position: 'Apprentice Developer', password: password, password_confirmation: password, email: 'tjsmith@joust.io'}])





