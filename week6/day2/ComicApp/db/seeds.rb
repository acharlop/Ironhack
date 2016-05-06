clark, tony, rick = User.create([
	{name: 'Clark Kent', email: 'clark@ironhack.com', password: 'ironhack', password_confirmation: 'ironhack'},
	{name: 'Tony Stark', email: 'tony@ironhack.com', password: 'ironhack', password_confirmation: 'ironhack'},
	{name: 'Rick Grimes', email: 'rick@ironhack.com', password: 'ironhack', password_confirmation: 'ironhack'}
])

clark.save
rick.save

clark.comics.create([
	{title: 'Watchmen', publisher: 'Vertigo'},
	{title: 'The Walking Dead', publisher: 'Planeta'}
])

rick.comics.create([
	{title: 'V for Vendetta', publisher: 'Vertigo'},
	{title: '300', publisher: 'Norma'}
])