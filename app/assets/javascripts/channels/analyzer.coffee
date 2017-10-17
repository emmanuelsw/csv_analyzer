App.analyzer = App.cable.subscriptions.create "AnalyzerChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    setTimeout (->
      if data.num_rows
        document.getElementById("progress").max = data.num_rows
      else
        document.getElementById("analyzed-rows").innerHTML = data.row
        document.getElementById("progress").value = data.row
      if data.row == document.getElementById("progress").max
        document.getElementById("return-btn").classList.toggle("hidden")
    ), 500