require "csv"


CSV.foreach('db/seeds/command_type_seed.csv', headers: true) do |row|
  CommandType.create(
    command_type: row['command_type'].to_s,
  )
end

CSV.foreach('db/seeds/command_seed.csv', headers: true) do |row|
  Command.create(
    command_type_id: row['command_type_id'].to_i,
    command: row['command'],
    description: row['description'],
  )
end

CSV.foreach('db/seeds/command_option_seed.csv', headers: true) do |row|
  CommandOption.create(
    command_id: row['command_id'].to_i,
    option: row['option'],
    description: row['description'],
  )
end