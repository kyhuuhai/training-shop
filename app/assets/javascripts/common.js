$(document).ready(function () {
  $(document).on('turbolinks:load', function () {
    $("form").on('submit', function(e){
      e.preventDefault();
      let message = $('#message').val();
      if (message.length > 0) {
        App.room.speak(message);
        $('#message').val('')
      }
    });
  })

  $(document).on("click", ".add-btn", function () {
    var id = $(this).data("id");
    var value = getValue(id);
    value++;
    $("#cart_" + id).attr("value", value);

    subtotal_id = "#subtotal-" + id;
    price = getPrice(id);

    subtotal = subTotal(price, value);
    subtotal = subtotal.toFixed(1);

    var total = getValueTotal();

    total = parseFloat(total) + parseFloat(price);
    document.querySelector(subtotal_id).innerHTML = subtotal + " $";
    document.querySelector("#total-price").innerHTML = total.toFixed(1) + " $";
  });

  $(document).on("click", ".sub-btn", function () {
    var id = $(this).data("id");
    var value = getValue(id);
    value--;
    $("#cart_" + id).attr("value", value);

    subtotal_id = "#subtotal-" + id;

    price = getPrice(id);

    subtotal = subTotal(price, value);
    subtotal = subtotal.toFixed(1);

    var total = getValueTotal();

    total = parseFloat(total) - parseFloat(price);
    document.querySelector(subtotal_id).innerHTML = subtotal + " $";
    document.querySelector("#total-price").innerHTML = total.toFixed(1) + " $";
  });
});

function getPrice(id) {
  var price_id = "#price-" + id;
  var valuePrice = document.querySelector(price_id).innerHTML;
  arrPrice = valuePrice.split(" ");
  var price = arrPrice[0];
  return price;
}

function getValue(id) {
  var value = $("#cart_" + id).val();
  return value;
}

function subTotal(price, value) {
  var subtotal = price * value;
  return subtotal;
}

function getValueTotal() {
  var valueTotal = document.querySelector("#total-price").innerHTML;
  arrTotal = valueTotal.split(" ");
  var total = arrTotal[0];
  return total;
}

let slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides((slideIndex += n));
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides((slideIndex = n));
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("demo");
  let captionText = document.getElementById("caption");
  if (n > slides.length) {
    slideIndex = 1;
  }
  if (n < 1) {
    slideIndex = slides.length;
  }
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex - 1].style.display = "block";
  dots[slideIndex - 1].className += " active";
  captionText.innerHTML = dots[slideIndex - 1].alt;
}
