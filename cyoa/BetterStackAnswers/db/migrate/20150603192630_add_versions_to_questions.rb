class AddVersionsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :ruby_version, :string
    add_column :questions, :rails_version, :string
    add_column :questions, :version_updated, :boolean
  end
end
