class AddContributionToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :contribution, :integer
  end
end
