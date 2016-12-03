Player.delete_all
Team.delete_all
Stadium.delete_all
Match.delete_all

t1 = Team.create({name: "Penguins", location: "Pittsburgh"})
t2 = Team.create({name: "Capitals", location: "Washington"})
t3 = Team.create({name: "Maple Leafs", location: "Toronto"})

Player.create({name: "Josh Archibald", age: 23, team_id: t1.id})
Player.create({name: "Tyler Biggs", age: 23, team_id: t1.id})
Player.create({name: "Nick Bonino", age: 28, team_id: t1.id})
Player.create({name: "Ian Cole", age: 27, team_id: t1.id})
Player.create({name: "Sidney Crosby", age: 28, team_id: t1.id})

Player.create({name: "Alexander Ovechkin", age: 30, team_id: t2.id})
Player.create({name: "Brad Malone", age: 27, team_id: t2.id})
Player.create({name: "Mike Webber", age: 28, team_id: t2.id})
Player.create({name: "Justin Williams", age: 34, team_id: t2.id})
Player.create({name: "John Carlson", age: 26, team_id: t2.id})

Player.create({name: "Brad Boyes", age: 34, team_id: t3.id})
Player.create({name: "Frank Corrado", age: 23, team_id: t3.id})
Player.create({name: "Peter Holland", age: 25, team_id: t3.id})
Player.create({name: "Matt Martin", age: 26, team_id: t3.id})
Player.create({name: "Morgan Riley", age: 22, team_id: t3.id})

s1 = Stadium.create({name: "Rogers Arena", capacity: 18910, location: "Vancouver"})
s2 = Stadium.create({name: "Rogers Place", capacity: 18641, location: "Edmonton"})
s3 = Stadium.create({name: "United Center", capacity: 19717, location: "Chicago"})

m1 = Match.create({home_team_id: t1.id, away_team_id: t2.id, stadium_id: s1.id})
m2 = Match.create({home_team_id: t2.id, away_team_id: t1.id, stadium_id: s2.id})
m3 = Match.create({home_team_id: t3.id, away_team_id: t1.id, stadium_id: s3.id})