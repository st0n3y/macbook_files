User.delete_all
Account.delete_all

user1 = User.create!({email: 'jay@gmail.com', password: 'password', password_confirmation: 'password'})
user2 = User.create!({email: 'david@snailmail.com', password: 'secret', password_confirmation: 'secret'})

account1 = Account.create({name: "offshore", amount: 1000000.00, user_id: user1.id})
account2 = Account.create({name: "local", amount: 0.01, user_id: user2.id})
account3 = Account.create({name:"offshore", amount: 10000.00, user_id: user2.id})