App.analyzer = App.cable.subscriptions.create "AnalyzerChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    if data.num_rows
      document.getElementById("progress").max = data.num_rows
    document.getElementById("analyzed-rows").innerHTML = data
    document.getElementById("progress").value = data