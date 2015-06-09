class AddDefaultValueToQuestions < ActiveRecord::Migration
  def change
  	change_column_default :questions, :version_updated, false
  end
end
