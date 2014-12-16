# == Schema Information
#
# Table name: athletes
#
#  id           :integer          not null, primary key
#  team_id      :integer
#  bib_number   :string(255)      not null
#  eligible     :boolean          default(TRUE)
#  first_name   :string(255)
#  last_name    :string(255)
#  sex          :integer          default(0)
#  created_at   :datetime
#  updated_at   :datetime
#  uscsa_number :string(255)
#

FactoryGirl.define do
  factory :athlete do
    bib_number "123ABC"
    eligible false
    first_name "first"
    last_name "last"
    sex 1
    team
  end
end
