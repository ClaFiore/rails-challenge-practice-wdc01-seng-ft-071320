class Building < ApplicationRecord

  has_many :offices
  has_many :companies, through: :offices
  # validates :

  def number_of_floors_available
    all_floors = Array(1..self.number_of_floors)
    self.offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def empty_offices
    number_of_floors_available.map { |f| offices.build(floor: f) }
  end

  def total_building_rent
    tot = self.offices.count * self.rent_per_floor.to_f
    tot.to_f.round(2)
  end

end
