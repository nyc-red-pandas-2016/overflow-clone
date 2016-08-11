class AddBestColumnToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :best_answer, :boolean, default: false
  end
end
