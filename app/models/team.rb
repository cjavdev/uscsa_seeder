# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  school_id  :integer
#  sex        :integer          default(0)
#  discipline :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
#

class Team < ActiveRecord::Base
  validates :school, :discipline, :sex, presence: true

  enum sex: [:male, :female]
  enum discipline: [:free_style_ski, :alpine_ski, :snowboard]

  belongs_to :school
  has_many :athletes
  has_many :users, through: :athletes

  def captains
    users.where(captain: true)
  end
end
