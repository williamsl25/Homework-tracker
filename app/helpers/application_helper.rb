module ApplicationHelper
  def is_admin?(user)
  admin_role = Role.find(:first, :conditions => ["name = ?", "admin"])
  return user.roles.include?(admin_role)
  end
end
