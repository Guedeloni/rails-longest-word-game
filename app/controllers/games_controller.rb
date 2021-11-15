require 'open-uri'
# require 'json'
# require 'date'

class GamesController < ApplicationController
  def new
    # TODO: generate random grid of letters
    grid = []
    10.times { grid << ('A'..'Z').to_a.sample }
    @letters = grid
  end

  def score
    @letters = params[:letters].split
    @attempt = params[:word].upcase
    @english = english?(@attempt)
    @valide = valide?(@attempt, @letters)
  end

  private

  # Tester l'attempt avec l'API Wagon Dictionary et récupérer fichier JSON
  # {"found":false,"word":"zzzz","error":"word not found"}
  # {"found":true,"word":"apple","length":5}
  def english?(attempt)
    url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
    json = JSON.parse(URI.open(url).read)
    json['found']
  end

  # Validite de l'attempt avec la grille :
  #   - mettre mot sous forme d'array
  #   - valide si tous les caract du mot sont en nb. =< a ceux de la grille
  def valide?(attempt, grid)
    attempt.chars.all? { |char| attempt.count(char) <= grid.count(char) }
  end
end
