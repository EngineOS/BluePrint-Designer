class WelcomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @blueprint_versions = BlueprintVersion.all.order(:updated_at).reverse_order.limit(10)
  end

end
