# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

# locations = Location.create([
#     {
#         name: "Kashyyk"
#     },
#     {
#         name: "Death Star"
#     },
#     {
#         name: "Tatooine"
#     }
# ])

# affiliations = Affiliation.create([
#     {
#         name: "Rebel Alliance"
#     },
#     {
#         name: "Sith"
#     },
# ])

# CSV.foreach(Rails.root.join('lib/seed_csv/sw_seeds_simple.csv'), headers: true) do |row|
#   Person.create( {
#     first_name: row["Name"], 
#     location: row["Location"],
#     species: row["Species"], 
#     gender: row["Gender"],
#     affiliation: row["Affiliations"],
#     weapon: row["Weapon"],
#     vehicle: row["Vehicle"]
#   } ) 
# end

csv_text = File.read(Rails.root.join('lib', 'seed_csv', 'sw_seeds_simple.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    l = Location.new
    p = Person.new
    a = Affiliation.new
    l.name = row['Location']
    a.name = row["Affiliations"]
    p.first_name = row['Name']
    p.location = l
    p.species = row["Species"]
    p.gender = row["Gender"]
    p.affiliation = a
    p.weapon = row["Weapon"]
    p.vehicle = row["Vehicle"]
    p.save
    puts "#{p.first_name}, #{p.location} saved"
  end




# people = Person.create([
#     {
#         first_name: "Darth",
#         last_name: "Vadar",
#         # location: locations.second,
#         # location: locations.third,
#         species: "Human",
#         gender: "male",
#         # affiliation: affiliations.second,
#     },
#     {
#         first_name: "Chewbacca",
#         location: locations.first,
#         species: "Wookie",
#         gender: "male",
#         affiliation: affiliations.first,
#     }
# ])
