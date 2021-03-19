class LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  has_many :people
end
