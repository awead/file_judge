class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end
