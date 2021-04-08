class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string     :mediumImageUrl
      t.string     :itemUrl
      t.string     :title
      t.string     :author
      t.string     :publisherName
      t.integer    :itemPrice
      t.string     :size
      t.string     :isbn
      t.references :user,          null: false

      t.timestamps
    end
  end
end
