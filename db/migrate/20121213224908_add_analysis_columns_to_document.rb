class AddAnalysisColumnsToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :word_count, :integer
    add_column :documents, :word_frequency, :text
  end
end
