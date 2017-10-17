class AnalyzerJob < ApplicationJob
  queue_as :default

  def perform(filename)
    csv = CSV.read(filename)
    ActionCable.server.broadcast "analyzer_channel", num_rows: csv.size
    csv.each_with_index do |row, index|
      name, genre, country = row
      Movie.create(name: name, genre: genre, country: country)
      ActionCable.server.broadcast "analyzer_channel", row: index + 1
    end
  end
  
end
