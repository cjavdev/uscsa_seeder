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

FactoryGirl.define do
  factory :athlete do
    team nil
bib_number "MyString"
eligible false
first_name "MyString"
last_name "MyString"
sex 1
  end

end
