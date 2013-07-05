# encoding: utf-8

class ImporterController < ApplicationController
  def create
    ImportFileProcessor.run(params[:file])

    redirect_to root_path
  end
end
