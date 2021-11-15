class ApplicationController < ActionController::Base

  def new
    # TODO: generate random grid of letters
    grid_size = 10
    grid = []
    grid_size.times { grid << ("A".."Z").to_a.sample }
    @letters = grid
  end

  def score
    raise
  end
end
