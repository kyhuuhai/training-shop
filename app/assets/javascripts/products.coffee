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
  $(document).on 'click', '.btn-update', ->
    items = $(this).data('items')
    item_carts = []
    for item in items
      id = item.id
      name = item.name
      price = getPrice(id)
      quatity = getValue(id)
      subtotal = subTotal(price, quatity)
      total = getValueTotal()
      item_carts.push({id: id, name: name, price: price, quantity: quatity})
    #   console.log id
    #   console.log name
    #   console.log price
    #   console.log quatity
    #   console.log subtotal
    #   console.log total
    # console.log item_carts
    $.ajax
      url: '/carts/update_cart',
      type: 'POST',
      beforeSend: (xhr) ->
        xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
        return
      data: {
        item_carts: item_carts,
      }
      typeData: 'json'
    return
  return
