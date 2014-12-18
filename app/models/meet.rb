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

class Meet < ActiveRecord::Base
  validate :name, presence: true, uniqueness: true

  has_many :events
end
