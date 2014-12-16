# == Schema Information
#
# Table name: meets
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  events_count :integer          default(0)
#

FactoryGirl.define do
  factory :meet do
    name "MyString"
  end

end
