class AnalyzerChannel < ApplicationCable::Channel
  def subscribed
    stream_from "analyzer_channel"
  end

  def unsubscribed
  end
end
