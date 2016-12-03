class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.references :home_team, foreign_key: true
      t.references :away_team, foreign_key: true
      t.references :stadium, foreign_key: true

      t.timestamps
    end
  end
end
