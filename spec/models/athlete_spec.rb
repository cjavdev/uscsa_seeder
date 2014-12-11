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
  describe '#sex' do
    it 'is valid as 0' do
      athlete = FactoryGirl.create(:athlete, sex: 0)
      expect(athlete).to be_valid
    end

    it 'only allows for 2 sex' do
      expect {
        FactoryGirl.build(:athlete, sex: 3)
      }.to raise_exception
    end
  end
end
