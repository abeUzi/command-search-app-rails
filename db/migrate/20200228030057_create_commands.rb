class CreateCommands < ActiveRecord::Migration[5.2]
  def change
    create_table :commands do |t|
      t.references :command_type, null: false
      t.string :command, null: false
      t.string :description
      t.timestamps
    end
  end
end
