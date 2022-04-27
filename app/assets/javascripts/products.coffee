getPrice = (id) ->
  price_id = '#price-' + id
  valuePrice = document.querySelector(price_id).innerHTML
  arrPrice = valuePrice.split(' ')
  price = arrPrice[0]
  price

getValue = (id) ->
  value = $('#cart_' + id).val()
  value

subTotal = (price, value) ->
  subtotal = price * value
  subtotal

getValueTotal = ->
  valueTotal = document.querySelector('#total-price').innerHTML
  arrTotal = valueTotal.split(' ')
  total = arrTotal[0]
  total

$(document).ready ->
  $(document).on 'click', '.add-btn', ->
    id = $(this).data('id')
    value = getValue(id)
    value++
    $('#cart_' + id).attr 'value', value
    subtotal_id = '#subtotal-' + id
    price = getPrice(id)
    subtotal = subTotal(price, value)
    subtotal = subtotal.toFixed(1)
    total = getValueTotal()
    total = parseFloat(total) + parseFloat(price)
    document.querySelector(subtotal_id).innerHTML = subtotal + ' $'
    document.querySelector('#total-price').innerHTML = total.toFixed(1) + ' $'
    return
  $(document).on 'click', '.sub-btn', ->
    id = $(this).data('id')
    value = getValue(id)
    value--
    $('#cart_' + id).attr 'value', value
    subtotal_id = '#subtotal-' + id
    price = getPrice(id)
    subtotal = subTotal(price, value)
    subtotal = subtotal.toFixed(1)
    total = getValueTotal()
    total = parseFloat(total) - parseFloat(price)
    document.querySelector(subtotal_id).innerHTML = subtotal + ' $'
    document.querySelector('#total-price').innerHTML = total.toFixed(1) + ' $'
    return
  return
