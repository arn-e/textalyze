class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.text :body
      t.string :author
      t.string :submitted_by

      t.timestamps
    end
  end
end
