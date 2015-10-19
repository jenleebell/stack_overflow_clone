class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :title, :string
      t.column :content, :string

      t.timestamps
    end
    create_table :comments do |t|
      t.column :content, :string

      t.timestamps
    end
  end
end
