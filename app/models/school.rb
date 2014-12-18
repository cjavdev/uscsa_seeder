# == Schema Information
#
# Table name: schools
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  abbreviation :string(255)      not null
#  created_at   :datetime
#  updated_at   :datetime
#  teams_count  :integer          default(0)
#

class School < ActiveRecord::Base
  validates :name, :abbreviation, presence: true

  has_many :teams
  has_many :athletes, through: :teams

  def captains
    # TODO: improve?
    athletes.to_a.select(&:captain?)
  end
end
