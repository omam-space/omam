json.id folder.id.to_s
json.name folder.name
json.path folder.path
if folder.parent
  json.parent do
    json.partial! 'folders/folder', folder: folder.parent
  end
end