# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seed_csv', 'sw_seeds.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    if row['Affiliations'].present?
    #   if row["Affiliations"].include? ','
    #     row["Affiliations"].split(',').each do |item|
    #       Affiliation.create!({:name => item})
        
      l = Location.new
      p = Person.new
      a = Affiliation.new
      l.name = row['Location'].titleize
      a.name = row["Affiliations"]
      p.name = row['Name'].titleize
      p.location = l
      p.species = row["Species"]
      p.gender = row["Gender"]
      p.affiliation = a
      p.weapon = row["Weapon"]
      p.vehicle = row["Vehicle"]
      p.save
      puts "#{p.name}, #{p.location} saved"
    end
  end
