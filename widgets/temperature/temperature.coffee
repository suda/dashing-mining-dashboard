class Dashing.Temperature extends Dashing.Widget

  @accessor 'current', ->
    return @get('displayedValue') if @get('displayedValue')
    points = @get('points')
    if points
      temps = []
      for point in points
        temps.push(point.y)      
      temps.join(" / ")

  ready: ->
    container = $(@node).parent()
    # Gross hacks. Let's fix this.
    width = (Dashing.widget_base_dimensions[0] * container.data("sizex")) + Dashing.widget_margins[0] * 2 * (container.data("sizex") - 1)    
    height = (Dashing.widget_base_dimensions[1] * container.data("sizey"))
    points = @get('points')
    @graph = new Rickshaw.Graph(
      element: @node
      width: width
      height: height
      renderer: "bar"
      gapSize: 0
      series: [
        {
        color: "#fff",
        data: points
        }
      ]
    )
    
    if points
      values = []
      for point in points
        values.push(point.x + 0.5)

      x_axis = new Rickshaw.Graph.Axis.X(graph: @graph, ticks: points.length + 2, tickValues:values, tickFormat: (x) ->      
        if x != Math.round(x)
          'Sensor #: ' + Math.floor(x).toString()                
      )
      
    @graph.render()

  onData: (data) ->
    if @graph
      @graph.series[0].data = data.points
      @graph.render()
