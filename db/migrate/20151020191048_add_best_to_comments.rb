class AddBestToComments < ActiveRecord::Migration
  def change
    add_column :comments, :best, :boolean, default: false
  end
end
