class MoviesController < ApplicationController

  def index
  end

  def results
  end

  def analyze
    file = params[:file]

    if File.extname(file.tempfile.path) != '.csv'
      flash[:alert] = 'Upload a CSV file.'
    else
      AnalyzerJob.perform_later(file.tempfile.path)
    end

    redirect_to results_path, status: :ok
  end

end
