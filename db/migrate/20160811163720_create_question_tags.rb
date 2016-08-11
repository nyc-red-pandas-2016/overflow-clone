class CreateQuestionTags < ActiveRecord::Migration
  def change
    create_table :question_tags do |t|
      t.integer :question_id, null: false
      t.integer :tag_id, null: false
    end
  end
end
