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
						rssfeed: '', url: 'joust.io', description: '', vision: "Joust strives to augment clarity in the world of communication.We seek to increase transparency by tackling issues such as misaligned expectations and tool ineffectiveness, while minimizing inefficiencies for our clients and their customers. Conquer is Joust's first implementation and will position Joust as a stable supplier of dynamic, cloud-based communication solutions."})
employees = User.create!([
	{name: 'Erich Seifert', position: 'CEO', password: password, password_confirmation: password, email: 'erichseifert@joust.io', image: File.open('app/assets/images/eSeifert.jpg', twitter: "erichseifert", linkedin: "http://www.linkedin.com/pub/erich-seifert/22/433/ab")}, 
	{name: 'Mike Lilly', position: 'CTO', password: password, password_confirmation: password, email: 'mikelilly@joust.io', image: File.open('app/assets/images/mLilly.jpg'), twitter: "wackyanimation", linkedin: "http://www.linkedin.com/pub/mike-lilly/34/522/302"}, 
	{name: 'Jeffrey Glusman', position: 'COO', password: password, password_confirmation: password, email: 'jeffreyglusman@joust.io', image: File.open('app/assets/images/jGlusman.jpg'), twitter: "theglus", linkedin: "http://www.linkedin.com/pub/jeffrey-glusman/33/46a/4a2"}, 
	{name: 'Eduardo Garcia Lopez', position: 'Java Wizard', password: password, password_confirmation: password, email: 'eglopez@joust.io', image: File.open('app/assets/images/eduardo.jpg')}, 
	{name: 'Vipul Jain', position: 'GWT Genie', password: password, password_confirmation: password, email: 'vjain@joust.io', image: File.open('app/assets/images/vJain.jpg')}, 
	{name: 'Daniel Schultz', position: 'Professional Expert', password: password, password_confirmation: password, email: 'dschultz@joust.io', image: File.open('app/assets/images/dSchultz.jpg')}, 
	{name: 'Alex Boerstler', position: 'Creative Director', password: password, password_confirmation: password, email: 'arboerstler@joust.io', image: File.open('app/assets/images/aBoerstler.jpg')}, 
	{name: 'Samantha Oliver', position: 'Content Strategist', password: password, password_confirmation: password, email: 'soliver@joust.io', image: File.open('app/assets/images/sOliver.jpg')}, 
	{name: 'Aysha Rafiq', position: 'Information Architect', password: password, password_confirmation: password, email: 'arafiq@joust.io', image: File.open('app/assets/images/aRafiq.jpg')}, 
	{name: 'TJ Smith', position: 'Apprentice Developer', password: password, password_confirmation: password, email: 'tjsmith@joust.io', image: File.open('app/assets/images/tjSmith.jpg')}])

User.all.each do |user|
	user.company = joust
	user.save!
end




