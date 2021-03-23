require 'csv'

module Api
  module V1
    class PeopleController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        people = Person.includes(:location, :affiliation)
        render json: PersonSerializer.new(people).serialized_json
      end

      def parser_method(file_path)
        CSV.foreach(file_path, encoding: "iso-8859-1:UTF-8", col_sep: "\t", quote_char: "\x00", headers: true) do |row|
          l = Location.new
          p = Person.new
          a = Affiliation.new
          l.name = row['Location']
          a.name = row["Affiliations"]
          p.name = row['Name']
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

      def import
        file_path = params[:file].path
        parser_method(file_path)
      end

      private

      def person_params
        params.require(:person).permit(
          :name,
          :location,
          :species,
          :gender,
          :affiliation,
          :weapon,
          :vehicle
        )
      end
    end
  end
end