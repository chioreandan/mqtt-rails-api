# frozen_string_literal: true

class ProductPolicy < ApplicationPolicy
  def index?
    show?
  end

  def show?
    user.admin? ||
      user.customer?
  end

  def create?
    user.admin?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end

  def as_json
    {
      can_edit_product: update?
    }
  end
end
