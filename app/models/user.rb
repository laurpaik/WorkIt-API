# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_one :athlete
  has_many :logs, through: :athlete
end
