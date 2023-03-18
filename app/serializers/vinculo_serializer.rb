class VinculoSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :address
end
