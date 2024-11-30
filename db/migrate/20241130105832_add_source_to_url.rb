class AddSourceToUrl < ActiveRecord::Migration[8.0]
  def change
    create_enum :source, %w[simple enterprise]
    add_column :urls, :source, :source, default: 'simple', null: false
    add_index :urls, :source
  end
end
