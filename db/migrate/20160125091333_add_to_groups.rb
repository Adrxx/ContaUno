class AddToGroups < ActiveRecord::Migration
  def change
    change_table :groups do |t|
      t.belongs_to :teacher, index:true
    end
  end
end
