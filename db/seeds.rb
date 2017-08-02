# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
u1 = User.create username: "Abraham", email: "abraham@gmail.com", password: "chicken", image:"https://s-media-cache-ak0.pinimg.com/736x/89/a5/76/89a57643cdabc92bdd11feff9450ec57--hairstyles-men-mens-hairstyle.jpg", is_admin:"false", gender:"Male", dob:"1968/10/12", country:"Australia", interest:"sports"

u2 = User.create username: "Barbara", email: "barbara@gmail.com", password: "chicken", image:"https://s-media-cache-ak0.pinimg.com/originals/83/01/37/8301375d44ab14641a4f91214ffbd5bb.jpg", is_admin:"false", gender:"Female", dob:"1990/08/15", country:"USA", interest:"books"

u3 = User.create username: "Charles", email: "charles@gmail.com", password: "chicken", image:"http://www3.pictures.gi.stylebistro.com/Leonardo+DiCaprio+Short+Hairstyles+Short+Wavy+XQw5pdln0N6l.jpg", is_admin:"false", gender:"Male", dob:"1974/11/11", country:"Canada", interest:"automobiles"

u4 = User.create username: "Denise", email: "denise@gmail.com", password: "chicken", image:"https://astrology-live-yoq2ao8jnrh6vktpia.netdna-ssl.com/wp-content/uploads/celebrities/717095kim-kardashian.jpg", is_admin:"false", gender:"Female", dob:"1980/10/21", country:"New Zealand", interest:"fashion"

u5 = User.create username: "Gordon", email: "gordon@gmail.com", password: "chicken", image:"http://www.thedailytop.com/wp-content/uploads/2014/07/614efd3abde4501f047f2d00f5191fa1.jpg", is_admin:"true", gender:"Male", dob:"1981/02/17", country:"USA", interest:"music"

puts "Created #{ User.all.length } users."

Message.destroy_all
m1 = Message.create content:"Seitan 8-bit fanny pack locavore intelligentsia. Banjo chia scenester squid, 90's hella twee dreamcatcher. Ennui gluten-free actually, neutra pour-over ramps occupy cold-pressed bitters pitchfork YOLO meh shoreditch plaid. ", sender_id:u1.id, receiver_id:u2.id
m2 = Message.create content:"Leggings vape master cleanse direct trade semiotics succulents hella try-hard literally gentrify. Freegan farm-to-table hoodie cred vice narwhal readymade fashion axe godard master cleanse. Subway tile small batch green juice pug lyft raw denim.", sender_id:u5.id, receiver_id:u4.id
m3 = Message.create content:"Biodiesel fanny pack put a bird on it kombucha chia sustainable tote bag echo park pour-over. Woke tbh gastropub lo-fi street art twee prism shabby chic fashion axe flannel food truck lomo banh mi.", sender_id:u2.id, receiver_id:u5.id
m4 = Message.create content:"Brunch mlkshk next level shaman taiyaki tacos, quinoa vaporware hammock occupy. Readymade hella swag, everyday carry blog man braid truffaut meditation sartorial plaid hashtag. Celiac vinyl prism pitchfork echo park 3 wolf moon farm-to-table intelligentsia whatever glossier. ", sender_id:u3.id, receiver_id:u4.id
m5 = Message.create content:"Umami tattooed blue bottle, keffiyeh succulents fixie man bun listicle portland occupy pickled intelligentsia irony tilde. Polaroid activated charcoal chillwave locavore, fingerstache keytar pinterest unicorn godard lumbersexual stumptown wolf jianbing actually. DIY kitsch ramps irony, poke biodiesel viral snackwave cronut chicharrones small batch direct trade knausgaard. Brunch tacos tumblr post-ironic street art.", sender_id:u4.id, receiver_id:u1.id
m6 = Message.create content:"Flannel mumblecore enamel pin, fixie before they sold out photo booth pabst 3 wolf moon neutra gentrify tumblr narwhal cray. Bespoke actually normcore green juice williamsburg tacos cred next level bushwick venmo. Cloud bread mixtape yr tacos,Flannel mumblecore enamel pin, fixie before they sold out photo booth pabst 3 wolf moon neutra gentrify tumblr narwhal cray. Bespoke actually normcore green juice williamsburg tacos cred next level bushwick venmo. Cloud bread mixtape yr tacos", sender_id:u2.id, receiver_id:u5.id

m7 = Message.create content:"Cronut organic ugh hoodie, dreamcatcher single-origin coffee photo booth cliche bicycle rights migas vinyl portland. Neutra ugh tousled stumptown ethical, banjo affogato keytar. Art party meggings asymmetrical scenester taxidermy poutine yr wolf ethical yuccie small batch venmo. Cronut vape kinfolk direct trade yuccie. Man braid etsy brunch cardigan stumptown, yuccie organic neutra cloud bread helvetica austin whatever. ", sender_id:u1.id, receiver_id:u4.id


puts "Created #{ Message.all.length } messages."
