class CreateCommandTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :command_types do |t|
      t.string :command_type, null: false
      t.timestamps
    end
  end
end
