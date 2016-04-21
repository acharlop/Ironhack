use1 = User.create name: "Old Guy", email: "og@perverted.org"
use2 = User.create name: "Quagmire Giggity", email: "pilot@hoponboard.xxx"
use3 = User.create name: "Chris Griffin", email: "chris@mcfatterson.com"
use4 = User.create name: "Meg Ugly", email: "fugly@barf.net"
use5 = User.create name: "Bryan Dog", email: "woof@thunder.qtpie"

Product.create(user: use1, title: "Brian", description: "Some awesome description", deadline: Time.now.midnight - 1.day)
Product.create(user: use2, title: "Stuie", description: "Another awesome description", deadline: Time.now + 2.days)
Product.create(user: use3, title: "The fat man", description: "Cant think of anything for this", deadline: Time.now + 1.month)
Product.create(user: use4, title: "A used mattress from my parent bedroom", description: "self explanitory", deadline: Time.now + 1.day)
Product.create(user: use4, title: "Strong paperboy", description: "blah blah blah", deadline: Time.now + 1.hour)
Product.create(user: use3, title: "Bird is the word", description: "Its my duty as a father", deadline: Time.now + 2.minutes)