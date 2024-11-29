class CreateUrls < ActiveRecord::Migration[8.0]
  def change
    create_table :urls, id: :uuid do |t|
      t.string :slug
      t.string :original

      t.timestamps
    end

    add_index :urls, :slug, unique: true
  end
end
