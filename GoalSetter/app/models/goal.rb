# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  user_id    :integer          not null
#  status     :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Goal < ActiveRecord::Base
  belongs_to(:user)
  
  STATUS = ['completed', 'not completed']
  
  validates :title, :user_id, presence: true
  validates :status, inclusion: { in: STATUS}
  
end
