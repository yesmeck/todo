class Todo < ActiveRecord::Base
  belongs_to :user

  def complete!
    update_attribute(:completed, true)
  end
end
