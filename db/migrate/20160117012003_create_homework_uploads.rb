class CreateHomeworkUploads < ActiveRecord::Migration
  def change
    create_table :homework_uploads do |t|
      t.string :code
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
