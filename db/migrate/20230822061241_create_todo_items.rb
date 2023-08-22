class CreateTodoItems < ActiveRecord::Migration[7.0]
  def change
    create_table :todo_items do |t|
      t.string :title
      t.text :body
      t.boolean :competed

      t.timestamps
    end
  end
end
