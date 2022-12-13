# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: "Simbzz")
user2 = User.create(name: "Jamie")

Match.create(stadium: 'Stamford Bridge', user_id: 1, location: 'London', price: 40, home_team: 'Chelsea', away_team: 'Arsenal', photo: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.football.london%2Fchelsea-fc%2Fchelsea-arsenal-live-stream-updates-17606316&psig=AOvVaw3rLgaTrcdt86Y-MEOWnbAG&ust=1670408251005000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCNC7yubh5PsCFQAAAAAdAAAAABAO', date: '23/12/2022')
Match.create(stadium: 'Emirates', user_id: 1, location: 'London', price: 40, home_team: 'Arsenal', away_team: 'Arsenal', photo: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.football.london%2Fchelsea-fc%2Fchelsea-arsenal-live-stream-updates-17606316&psig=AOvVaw3rLgaTrcdt86Y-MEOWnbAG&ust=1670408251005000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCNC7yubh5PsCFQAAAAAdAAAAABAO', date: '26/12/2022')
Match.create(stadium: 'Etihad', user_id: 1, location: 'Manchester', price: 40, home_team: 'Man City', away_team: 'Arsenal', photo: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.football.london%2Fchelsea-fc%2Fchelsea-arsenal-live-stream-updates-17606316&psig=AOvVaw3rLgaTrcdt86Y-MEOWnbAG&ust=1670408251005000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCNC7yubh5PsCFQAAAAAdAAAAABAO', date: '29/12/2022')

Ticket.create(match_id: 1, user_id: 1, date: "23/12/2022", city: "London")
Ticket.create(match_id: 1, user_id: 2, date: "23/12/2022", city: "London")
Ticket.create(match_id: 2, user_id: 2, date: "23/12/2022", city: "London")
