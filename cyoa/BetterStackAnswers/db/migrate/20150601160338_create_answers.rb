class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :answer_id
      t.integer :question_id
      t.boolean :is_accepted
      t.integer :up_vote_count
      t.date :creation_date
      t.string :link
      t.date :last_edit_date
      t.text :body

      t.timestamps null: false
    end
  end
end
