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
m1 = Message.create content:"Matty is", sender_id:u1.id, receiver_id:u2.id
m2 = Message.create content:"Gory stuff", sender_id:u5.id, receiver_id:u4.id
m3 = Message.create content:"How can I", sender_id:u2.id, receiver_id:u5.id
m4 = Message.create content:"Go through my life", sender_id:u3.id, receiver_id:u4.id
m5 = Message.create content:"Without you", sender_id:u4.id, receiver_id:u1.id
m6 = Message.create content:"And tell me why", sender_id:u2.id, receiver_id:u5.id

puts "Created #{ Message.all.length } messages."
