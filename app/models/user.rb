# Created by Victor, edited by Maxwell Barvian
class User < ActiveRecord::Base

  # Generates CSV of
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end

  # set association
  belongs_to :login
  belongs_to :company
  # has_many :saved_lists, through: :saved_list_users
  # has_many :surveys, through: :user_surveys
  has_many :giving_backs
  has_many :user_phones, dependent: :destroy
  has_many :graduate_degrees
  has_many :undergraduate_degrees

  enum status: [ :currently_enrolled, :alumni ]

  accepts_nested_attributes_for :login
  accepts_nested_attributes_for :company
  accepts_nested_attributes_for :user_phones, reject_if: :all_blank, allow_destroy: true
end # added by Leiyang Guo
