class User < ActiveRecord::Base
  # set association
  belongs_to :login
  #belongs_to :company
  #has_many :saved_lists, through: :saved_list_users
  #has_many :giving_backs
  #has_one :company
  #has_many :user_phones
  #has_many :graduate_degrees
  #has_many :undergraduate_degrees
end # added by Leiyang Guo


