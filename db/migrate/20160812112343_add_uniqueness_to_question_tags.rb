class AddUniquenessToQuestionTags < ActiveRecord::Migration
  def change
    add_index :question_tags, [:question_id, :tag_id], unique: true
  end
end
