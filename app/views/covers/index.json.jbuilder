json.array!(@covers) do |cover|
  json.extract! cover, :id, :title, :description, :author, :ytlink
  json.url cover_url(cover, format: :json)
end
