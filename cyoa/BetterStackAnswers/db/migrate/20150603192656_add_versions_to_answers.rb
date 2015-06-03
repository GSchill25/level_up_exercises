class AddVersionsToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :ruby_version, :string
    add_column :answers, :rails_version, :string
    add_column :answers, :version_updated, :boolean
  end
end
