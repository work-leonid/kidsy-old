class CreateJournalItems < ActiveRecord::Migration[7.0]
  def change
    create_table :journal_items do |t|
      t.text :body
      t.date :published_at
      t.string :title

      t.timestamps
    end
  end
end
