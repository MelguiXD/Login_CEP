class Vinculo < ApplicationRecord
  belongs_to :user
  belongs_to :address
end
