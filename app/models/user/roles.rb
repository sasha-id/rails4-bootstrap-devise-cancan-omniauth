module User::Roles
  extend ActiveSupport::Concern
  
  included do
  end


  def roles=(roles)
    self.roles_mask = (roles & AppConfig.roles).map { |r| 2**AppConfig.roles.index(r) }.inject(0, :+)
  end

  def roles
    AppConfig.roles.reject do |r|
      ((roles_mask || 0) & 2**AppConfig.roles.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role.to_s)
  end

  # Role Inheritance
  def role?(base_role)
    AppConfig.roles.index(base_role.to_s) <= AppConfig.roles.index(role)
  end
end