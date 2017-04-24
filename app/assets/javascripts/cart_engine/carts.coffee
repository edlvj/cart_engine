@decQty =(id) ->
  $("input#"+id)[0].value -= 1 if $("input#"+id)[0].value > 1
  
@incQty =(id) ->
  val = parseInt($("input#"+id)[0].value)
  $("input#"+id)[0].value = val + 1