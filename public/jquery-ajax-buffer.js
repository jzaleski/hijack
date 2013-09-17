$.ajaxBuffer = [];

$.ajaxBuffer.abortAll = function() {
  $(this).each(function(index, jqXHR) {
    jqXHR.abort();
  });
  $.ajaxBuffer.splice(0, $.ajaxBuffer.length);
}

$.ajaxSetup({
  beforeSend: function(jqXHR) {
    $.ajaxBuffer.push(jqXHR);
  },
  complete: function(jqXHR) {
    var index = $.ajaxBuffer.indexOf(jqXHR);
    if (index != -1) {
      $.ajaxBuffer.splice(index, 1);
    }
  }
});
