class DeviseCreateJurors < ActiveRecord::Migration
  def self.up
    create_table(:jurors) do |t|
      t.database_authenticatable :null => false
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      # t.lockable

      t.timestamps
    end

    add_index :jurors, :email,                :unique => true
    add_index :jurors, :confirmation_token,   :unique => true
    add_index :jurors, :reset_password_token, :unique => true
    # add_index :jurors, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :jurors
  end
end
