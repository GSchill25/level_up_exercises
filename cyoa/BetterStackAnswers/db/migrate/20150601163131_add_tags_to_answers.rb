class AddTagsToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :tags, :text
  end
end
