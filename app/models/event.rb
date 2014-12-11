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

class Event < ActiveRecord::Base
  belongs_to :meet
end
