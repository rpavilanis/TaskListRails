class AddPersonToTask < ActiveRecord::Migration
  def change
    add_reference :tasks, :person, index: true, foreign_key: true
  end
end
