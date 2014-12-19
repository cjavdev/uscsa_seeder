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
  belongs_to :school
  has_many :athletes
  has_many :users, through: :athletes

  validates :school, :discipline, :sex, presence: true
  after_create :update_school_teams_count

  enum sex: [:male, :female]
  enum discipline: [:free_style_ski, :alpine_ski, :snowboard]

  FULL_DISCIPLINES = {
    free_style_ski: 'Free Style Ski',
    alpine_ski: 'Alpine Ski',
    snowboard: 'Snowboard'
  }

  def update_school_teams_count
    self.school.teams_count += 1;
    self.school.save
  end

  def self.full_disciplines
    disciplines.keys.map { |d| FULL_DISCIPLINES[d.to_sym] }
  end

  def full_discipline
    FULL_DISCIPLINES[discipline.to_sym]
  end

  def captains
    users.where(captain: true)
  end
end
