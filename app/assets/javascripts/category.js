$(document).on('turbolinks:load', function() {
  $(".newCat").on("click", function(e) {
    $(".newCat").hide();
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(response){
      $(".catForm").html(response).append()

    });
    e.preventDefault();
  })

  $(".editCat").on("click", function(e) {
    $(".editCat").hide();
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(response){
      $(".catForm").html(response).append()

    });
    e.preventDefault();
  })
})
