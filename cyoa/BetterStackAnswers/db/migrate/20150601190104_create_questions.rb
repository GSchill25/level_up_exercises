class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :question_id
      t.integer :accepted_answer_id
      t.text :body
      t.date :creation_date
      t.string :tags
      t.text :title
      t.integer :up_vote_count
      t.integer :answer_count
      t.boolean :is_answered
      t.text :link

      t.timestamps null: false
    end
  end
end
