Artist.delete_all
Album.delete_all
Gig.delete_all
Venue.delete_all
# delete_all is an ActiveRecord method.

a1 = Artist.create({name: "Black Rivers"})
a2 = Artist.create({name: "Muse"})
a3 = Artist.create({name: "DJ Shadow"})

Album.create({name: "Black Rivers", artist_id: a1.id})
Album.create({name: "Drones", artist_id: a2.id})
Album.create({name: "The Mountain Will Fall", artist_id: a3.id})

v1 = Venue.create({name: "O2", location: "London"})
v2 = Venue.create({name: "Murrayfield", location: "Edinburgh"})
v3 = Venue.create({name: "Budokan", location: "Tokyo"})

Gig.create({price: 40, date: DateTime.now() + 30, artist_id: a1.id, venue_id: v1.id})
Gig.create({price: 30, date: DateTime.now() + 30, artist_id: a2.id, venue_id: v2.id})
Gig.create({price: 35, date: DateTime.now() + 30, artist_id: a3.id, venue_id: v3.id})