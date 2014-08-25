class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :username
      t.json :infos

      t.timestamps
    end
  end
end
