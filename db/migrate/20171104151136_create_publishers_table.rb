class CreatePublishersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :publishers do |t|
      t.references :company, foreign_key: true
      t.references :game, foreign_key: true
    end
  end
end
