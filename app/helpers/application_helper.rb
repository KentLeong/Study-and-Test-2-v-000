module ApplicationHelper
  def admin?
    if current_user != nil
      true if current_user.role == "admin"
    end
  end

  def mod?
    if current_user != nil
      true if current_user.role == "moderator"
    end
  end

  def admin_or_mod?
    admin? || mod?
  end
end
