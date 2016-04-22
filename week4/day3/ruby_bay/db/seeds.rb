use1 = User.create(name: "Old Guy", email: "og@perverted.org", password: "abcde")
use2 = User.create(name: "Quagmire Giggity", email: "pilot@hoponboard.xxx", password: "abcde")
use3 = User.create(name: "Chris Griffin", email: "chris@mcfatterson.com", password: "abcde")
use4 = User.create(name: "Meg Ugly", email: "fugly@barf.net", password: "abcde")
use5 = User.create(name: "Bryan Dog", email: "woof@thunder.qtpie", password: "abcde")
users = [use1,use2,use3,use4,use5]

prod1 = Product.create(user: use1, title: "Brian", description: "Some awesome description", deadline: 1.day.ago)
prod2 = Product.create(user: use1, title: "Stuie", description: "Another awesome description", deadline: 2.days.from_now)
prod3 = Product.create(user: use1, title: "The fat man", description: "Cant think of anything for this", deadline: 1.month.from_now)
prod4 = Product.create(user: use2, title: "A used mattress from my parent bedroom", description: "self explanitory",deadline: 1.day.from_now)
prod5 = Product.create(user: use3, title: "Strong paperboy", description: "blah blah blah", deadline: 1.hour.ago)
prod6 = Product.create(user: use4, title: "Bird is the word", description: "Its my duty as a father", deadline: 2.minutes.from_now)
products = [prod1,prod2,prod3,prod4,prod5,prod6]

100.times {
	Bid.create(amount: rand(0.0...99999.9999), user: users.sample, product: products.sample)
}