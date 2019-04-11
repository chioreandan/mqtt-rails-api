# frozen_string_literal: true

class ProductPolicy < ApplicationPolicy
  # def show?
  #   user.admin?
  # end

  # def create?
  #   show?
  # end

  # def update?
  #   show?
  # end

  def as_json
    {
      can_edit_product: update?
    }
  end
end
