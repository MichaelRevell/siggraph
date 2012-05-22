class HomeController < ActionController::Base
  def index
  end
  def sample
  end

  def display
    @beliefs = Belief.all
    @users = User.all
    @related_beliefs = "t"
  end

  def add_beliefs
  end
end
