class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.boolean :is_favorite

      t.timestamps
    end
  end
end
