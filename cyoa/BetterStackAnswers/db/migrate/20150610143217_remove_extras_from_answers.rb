class RemoveExtrasFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :creation_date, :date
    remove_column :answers, :last_edit_date, :date
    remove_column :answers, :tags, :text
    remove_column :answers, :ruby_version, :string
    remove_column :answers, :rails_version, :string
    remove_column :answers, :version_updated, :boolean
  end
end
