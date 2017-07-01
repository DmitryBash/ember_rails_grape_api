class List < ApplicationRecord
  enum status: [ :active, :complited ]
end
