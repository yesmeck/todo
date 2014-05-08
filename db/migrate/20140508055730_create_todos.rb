class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.boolean :completed, default: false
      t.integer :user_id
      t.integer :position

      t.timestamps
    end
  end
end
