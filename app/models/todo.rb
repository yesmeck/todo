class Todo < ActiveRecord::Base
  belongs_to :user

  def complete!
    update_attribute(:completed, true)
  end

  def uncomplete!
    update_attribute(:completed, false)
  end
end
