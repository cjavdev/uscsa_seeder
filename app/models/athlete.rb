# == Schema Information
#
# Table name: athletes
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  bib_number :string(255)      not null
#  eligible   :boolean          default(TRUE)
#  first_name :string(255)
#  last_name  :string(255)
#  sex        :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
#

class Athlete < ActiveRecord::Base
  validates :team, :bib_number, :first_name, :last_name, :sex, presence: true
  default_scope { order(:last_name, :first_name) }
  enum sex: [:male, :female]
  belongs_to :team
  has_one :user

  def captain?
    !!user.try(:captain)
  end

  def name
    "#{ first_name } #{ last_name }"
  end
end
