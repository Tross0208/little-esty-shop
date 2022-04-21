class Admin::AdminController < ApplicationController
  def dashboard
    @invoice = Invoice.all
  end
end
