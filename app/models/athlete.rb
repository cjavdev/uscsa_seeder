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

class Athlete < ActiveRecord::Base
  validates :team, :bib_number, :first_name, :last_name, :sex, presence: true
  default_scope { order(:last_name, :first_name) }
  enum sex: [:male, :female]
  belongs_to :team
  has_one :school, through: :team
  has_one :user

  def captain?
    !!user.try(:captain)
  end

  def name
    "#{ first_name } #{ last_name }"
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << [
          "id",
          "team_id",
          "bib_number",
          "eligible",
          "first_name",
          "last_name",
          "sex",
          "created_at",
          "updated_at",
          "uscsa_number",
      ]
      all.each do |athlete|
        csv << [
          athlete.id,
          athlete.team_id,
          athlete.bib_number,
          athlete.eligible,
          athlete.first_name,
          athlete.last_name,
          athlete.sex,
          athlete.created_at,
          athlete.updated_at,
          athlete.uscsa_number,
        ]
      end
    end
  end
end
