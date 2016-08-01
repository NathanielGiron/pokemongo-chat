class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
