json.volumes do
  json.array! @volumes do |volume|  
    json.partial! 'volumes/volume', collection: @volumes, as: :volume
  end
end