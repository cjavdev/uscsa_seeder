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

require 'rails_helper'

RSpec.describe Athlete, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
