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
  enum sex: [:male, :female]
  enum discipline: [:free_style_ski, :alpine_ski, :snowboard]
  belongs_to :school
end
