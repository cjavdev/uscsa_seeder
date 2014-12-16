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

FactoryGirl.define do
  factory :team do
    school
    sex 1
    discipline 1
  end
end
