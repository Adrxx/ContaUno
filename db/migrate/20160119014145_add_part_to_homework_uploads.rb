class AddPartToHomeworkUploads < ActiveRecord::Migration
  def change
    change_table :homework_uploads do |t|
      t.belongs_to :group, index:true
    end
  end
end