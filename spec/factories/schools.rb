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

FactoryGirl.define do
  factory :school do
    name "MyString"
    abbreviation "MyString"
  end
end
