class Folder
  include Mongoid::Document
  field :name, type: String
  embedded_in :folder
end
