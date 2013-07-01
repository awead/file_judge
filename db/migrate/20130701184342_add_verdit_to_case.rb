class AddVerditToCase < ActiveRecord::Migration
  def change
    add_column :cases, :verdict, :text
  end
end
