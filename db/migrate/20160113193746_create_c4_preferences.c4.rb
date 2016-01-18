# This migration comes from c4 (originally 20160110031948)
class CreateC4Preferences < ActiveRecord::Migration
  def change
    create_table :c4_preferences do |t|

      t.text :values, default: "[]"

      t.text :youtube
      t.text :facebook
      t.text :twitter

      t.string :email
      t.string :telephone
      t.string :telephone2

    end
  end
end
