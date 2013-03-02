class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include User::AuthDefinitions
  include User::Roles

  has_many :identities


  field :email, type: String
  field :image, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :roles_mask, type: Integer
  
  validates_presence_of :email, :first_name, :last_name

  def full_name
    "#{first_name} #{last_name}"
  end

end
