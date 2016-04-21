use1 = User.create name: "Old Guy", email: "og@perverted.org"
use2 = User.create name: "Quagmire Giggity", email: "pilot@hoponboard.xxx"
use3 = User.create name: "Chris Griffin", email: "chris@mcfatterson.com"
use4 = User.create name: "Meg Ugly", email: "fugly@barf.net"
use5 = User.create name: "Bryan Dog", email: "woof@thunder.qtpie"
users = [use1,use2,use3,use4,use5]

prod1 = Product.create(user: use1, title: "Brian", description: "Some awesome description", deadline: Time.now.midnight - 1.day)
prod2 = Product.create(user: use2, title: "Stuie", description: "Another awesome description", deadline: Time.now + 2.days)
prod3 = Product.create(user: use3, title: "The fat man", description: "Cant think of anything for this", deadline: Time.now + 1.month)
prod4 = Product.create(user: use4, title: "A used mattress from my parent bedroom", description: "self explanitory", deadline: Time.now + 1.day)
prod5 = Product.create(user: use4, title: "Strong paperboy", description: "blah blah blah", deadline: Time.now + 1.hour)
prod6 = Product.create(user: use3, title: "Bird is the word", description: "Its my duty as a father", deadline: Time.now + 2.minutes)
products = [prod1,prod2,prod3,prod4,prod5,prod6]

100.times do 
	Bid.create(amount: rand(0.0...99999.9999), user: users.sample, product: products.sample)
end