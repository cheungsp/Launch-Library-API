class AddColumnsToMission < ActiveRecord::Migration[5.1]
  def change
    add_column :missions, :name, :string
    add_column :missions, :agency, :string
    add_column :missions, :location, :string
    add_column :missions, :time, :string
    add_column :missions, :launch_wiki, :string
    add_column :missions, :agency_wiki, :string
    add_column :missions, :rocket_wiki, :string
  end
end
