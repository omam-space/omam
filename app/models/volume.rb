class Volume
  include Mongoid::Document

  before_save :create_volume
  before_destroy :remove_volume

  field :label, type: String
  field :address, type: String

  validates :label, presence: true, uniqueness: true
  validates :address, presence: true

  has_many :folders

  def exists?
    File.exists? self.address
  end

  def create_volume
    unless File.exist?(self.address)
      FileUtils.mkdir_p(self.address)
    end
  end

  def remove_volume
    unless File.exist?(self.address)
      FileUtils.rm_rf(self.address)
    end
  end
end
