class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.json :infos

      t.timestamps
    end
  end
end
