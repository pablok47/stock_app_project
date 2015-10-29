function ready() {
  // console.log("the document is ready")
  // console.dir($('form'));
  $('form').on('ajax:complete', function(event, data) {
    // console.dir(xhr.responseText);
    // window.location.reload();
    // console.log(data);
  $('.stock-container').append(data.responseText);

    $('#stock_name').val("");
    // window.location.reload();

    // $('table').append(xhr.responseText);
  });
}

$(document).on('ready page:load', ready);