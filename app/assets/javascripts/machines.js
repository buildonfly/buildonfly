function loadMachines(){
  var project_id = $("#project_id").val();
  $.getJSON("/projects/" +project_id+ "/machines.json", function(data) {
    var template = $('#machinesTpl').html();
    $('table#machines tbody').html("");
    for(var i=0;i<data.length;i++){
      var html = Mustache.to_html(template, data[i]);
      $('table#machines tbody').append(html);
    }
    $("#machines").off("click", ".setup-button").on("click", ".setup-button", function(ev) {
      ev.preventDefault();
      var machineId = $(ev.target).closest(".machine").data("machine-id");
      $.post('/machines/' + machineId + '/setup', {}, function() {
        setInterval(loadMachines, 2000);
      }, 'json');
    });
  });
}

$(document).ready(function(){
  if($("#machines-container").length > 0){
    loadMachines();
  }
});

