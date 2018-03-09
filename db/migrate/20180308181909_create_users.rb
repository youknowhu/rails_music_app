class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, presence: true
      t.string :password_digest, presence: true
      t.string :session_token, presence: true

      t.timestamps
    end
  end
end
