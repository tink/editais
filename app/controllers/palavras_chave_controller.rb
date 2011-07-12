class PalavrasChaveController < ApplicationController
  def show
    @editais = Edital.tagged_with(params[:id])
  end
end
