class CreateCommandOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :command_options do |t|
      t.references :command, null: false
      t.string :option, null: false
      t.string :description
      t.timestamps 
    end
  end
end
