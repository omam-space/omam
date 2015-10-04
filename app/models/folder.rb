class Folder
  include Mongoid::Document
  field :name, type: String

  before_save :create_folder
  before_destroy :remove_folder

  belongs_to :parent, class_name: 'Folder'
  belongs_to :volume

  validates :name, presence: true, format: { with: /[a-zA-Z0-9\-_]/ }
  validates :volume, presence: true

  def create_folder
    unless File.exist?(path)
      FileUtils.mkdir_p(path)
    end
  end

  def remove_folder
    unless File.exist?(path)
      FileUtils.rm_rf(path)
    end
  end

  def path
    if self.parent
      self.volume.address + "/" + self.parent.name + "/" + self.name
    end
    self.volume.address + "/" + self.name
  end
end
