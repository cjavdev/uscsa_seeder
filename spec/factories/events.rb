# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  meet_id    :integer
#  start_at   :datetime
#  sex        :integer          default(0)
#  discipline :integer          default(0)
#

FactoryGirl.define do
  factory :event do
    
  end

end
