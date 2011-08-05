class CreateEditorships < ActiveRecord::Migration
  def self.up
    create_table :editorships do |t|
      t.integer :program_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :editorships
  end
end
