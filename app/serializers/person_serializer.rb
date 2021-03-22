class PersonSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :location, :species, :gender, :affiliation, :weapon, :vehicle
end
