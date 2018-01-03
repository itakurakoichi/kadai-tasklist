class CreateTaks2s < ActiveRecord::Migration[5.0]
  def change
    create_table :taks2s do |t|
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
