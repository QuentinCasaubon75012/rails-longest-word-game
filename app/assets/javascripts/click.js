$(document).ready(function() {
  var letters = []
  $('li').on('click', function() {
    var letter = $(this).text();
    $(this).slideUp()
    letters.push(letter)
    $('input[type=text]').val(letters.join(""));
  })
})
