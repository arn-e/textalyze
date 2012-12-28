class AddRidToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :rid_analysis, :text
  end
end
