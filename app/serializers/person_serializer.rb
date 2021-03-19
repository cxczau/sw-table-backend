class PersonSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :location_id, :species, :gender, :affiliation_id, :weapon, :vehicle
end
