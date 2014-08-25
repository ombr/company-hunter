class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.integer :repository_id
      t.integer :person_id
      t.json :infos

      t.timestamps
    end
  end
end
