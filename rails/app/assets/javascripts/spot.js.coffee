$ ->
  return unless $("body").hasClass("spots") && $("body").hasClass("index")

  horizon_charts_metadata =
    ph:        
      label: "pH"
      format: "> ,.2f"
    ec:
      label: "E.C."
      format: "> ,.2f" 
    temp:
      label: "Temp"
      format: "> ,.2f"
    rh:
      label: "R.H."
      format: "> ,.2f"
    battery:
      label: "Batt"
      format: "> ,.2p"
    res_level:
      label: "Res"
      format: "> ,.2p"

  property = (args) ->
    context.metric((start, stop, step, callback) ->
      url = "/data.json?source=" + args[0] + "&property=" + args[1] + "&start=" + start + "&stop=" + stop
      d3.json(url, (error, rows) ->
        values = []
        rows.forEach((d) ->
          if args[1] == "battery" || args[1] == "res_level"
            values.push(d.value * 100)
          else
            values.push(d.value)
        )
        callback(null, values)
      )
    , horizon_charts_metadata[args[1]].label)

  context = cubism.context()
    .serverDelay(3000)
    .step(10000)
    .size(6*60*2)

  i=1
  while i < 5
    d3.select("#spot" + i).selectAll(".axis")
      .data(["top", "bottom"])
      .enter().append("div")
      .attr("class", (d) -> d + " axis")
      .each((d) -> d3.select(this).call(context.axis().ticks(6).orient(d)))

    d3.select("#spot" + i).append("div")
      .attr("class", "rule")
      .call(context.rule())
 
    d3.select("#spot" + i)
      .selectAll(".horizon")
      .data([["spot" + i,"ph"],["spot" + i,"ec"],["spot" + i,"temp"],["spot" + i,"rh"],["spot" + i, "battery"],["spot" + i, "res_level"]].map(property))
      .enter()
      .insert("div", ".bottom").attr("class", "horizon")
      .call(context.horizon().format(d3.format("> ,.2f")))

    d3.select("#spot" + i)
      .selectAll(".horizon")
      .data(["pH", "mS/cm", "°F", "%", "%", "%"])
      .append("div").attr("class", "unit")
      .text((d) -> d) 
    i++
 
  context.on("focus", (i) ->
    d3.selectAll(".value").style("right", i == null ? null : context.size() - i + "px")
  ) 
