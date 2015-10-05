class Folder
  include Mongoid::Document

  field :name, type: String

  before_save :create_folder
  before_update :update_folder
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
    FileUtils.rm_rf(path)
  end

  def update_folder
    # old_folder = Folder.find(self.id)
    # FileUtils.mv(old_folder.path, self.path)
  end

  def path
    unless self.parent
      self.volume.address + "/" + self.name
    end

    parents = []
    parent = self.parent

    while parent
      parents.unshift parent.name
      parent = parent.parent
    end

    parents.push self.name
    parents.unshift self.volume.address

    parents.join("/")
  end
end
