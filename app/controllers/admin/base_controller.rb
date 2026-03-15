class Admin::BaseController < ApplicationController
  before_action :authenticate

  private

  def authenticate
    authenticate_or_request_with_http_basic("Launchboard Admin") do |username, password|
      secure_compare(username, admin_username) && secure_compare(password, admin_password)
    end
  end

  def secure_compare(left, right)
    ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(left), ::Digest::SHA256.hexdigest(right))
  end

  def admin_username
    ENV.fetch("ADMIN_USERNAME", "admin")
  end

  def admin_password
    ENV.fetch("ADMIN_PASSWORD", "launchboard-demo")
  end
end
