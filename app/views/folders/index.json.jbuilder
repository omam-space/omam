json.folders do
  json.array! @folders do |folder|  
    json.partial! 'folders/folder', collection: @folders, as: :folder
  end
end