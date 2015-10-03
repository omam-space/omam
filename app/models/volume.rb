class Volume
  include Mongoid::Document
  field :label, type: String
  field :address, type: String

  validates :label, presence: true, uniqueness: true
  validates :label, presence: true

  def exists?
    File.exists? self.address
  end
end
