# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
password = 'JoustSIB13'
User.destroy_all
Company.destroy_all
joust = Company.create!({name: 'Joust', tagline: 'We make customer service not suck.', 
						location: 'Cambridge, MA', facebookhandle: '', twitterhandle: '@JoustInc',
						rssfeed: '', url: 'joust.io', description: ''})
employees = User.create!([
	{name: 'Erich Seifert', position: 'CEO', password: password, password_confirmation: password, email: 'erichseifert@joust.io', avatar: File.open('app/assets/images/eSeifert.jpg')}, 
	{name: 'Mike Lilly', position: 'CTO', password: password, password_confirmation: password, email: 'mikelilly@joust.io', avatar: File.open('app/assets/images/mLilly.jpg')}, 
	{name: 'Jeffrey Glusman', position: 'COO', password: password, password_confirmation: password, email: 'jeffreyglusman@joust.io', avatar: File.open('app/assets/images/jGlusman.jpg')}, 
	{name: 'Eduardo Garcia Lopez', position: 'Java Wizard', password: password, password_confirmation: password, email: 'eglopez@joust.io', avatar: File.open('app/assets/images/eduardo.jpg')}, 
	{name: 'Vipul Jain', position: 'GWT Genie', password: password, password_confirmation: password, email: 'vjain@joust.io', avatar: File.open('app/assets/images/vJain.jpg')}, 
	{name: 'Daniel Schultz', position: 'Professional Expert', password: password, password_confirmation: password, email: 'dschultz@joust.io', avatar: File.open('app/assets/images/dSchultz.jpg')}, 
	{name: 'Alex Boerstler', position: 'Creative Director', password: password, password_confirmation: password, email: 'arboerstler@joust.io', avatar: File.open('app/assets/images/aBoerstler.jpg')}, 
	{name: 'Samantha Oliver', position: 'Content Strategist', password: password, password_confirmation: password, email: 'soliver@joust.io', avatar: File.open('app/assets/images/sOliver.jpg')}, 
	{name: 'Aysha Rafiq', position: 'Information Architect', password: password, password_confirmation: password, email: 'arafiq@joust.io', avatar: File.open('app/assets/images/aRafiq.jpg')}, 
	{name: 'TJ Smith', position: 'Apprentice Developer', password: password, password_confirmation: password, email: 'tjsmith@joust.io', avatar: File.open('app/assets/images/tjSmith.jpg')}])

User.all.each do |user|
	user.company = joust
	user.save!
end




