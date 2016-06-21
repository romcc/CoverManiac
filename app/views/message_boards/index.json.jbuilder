json.array!(@message_boards) do |message_board|
  json.extract! message_board, :id, :title, :message
  json.url message_board_url(message_board, format: :json)
end
