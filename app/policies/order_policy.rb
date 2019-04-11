# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
  def index?
    show?
  end

  def show?
    user.admin? ||
      user.customer?
  end

  def create?
    show?
  end

  def update?
    show?
  end

  def destroy?
    show?
  end
end
