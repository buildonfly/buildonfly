function loadBuilds(pageNum){
  var project_id = $("#project_id").val();
  $.getJSON("/projects/" +project_id+ "/builds.json?page_num="+pageNum, function(data) {
    var template = $('#buildTpl').html();
    for(var i=0;i<data.length;i++){
      var html = Mustache.to_html(template, data[i]);
      $('ul#builds').append(html);
    }
  });
}

$(document).ready(function(){
  if($("#dashboard").length > 0){
    loadBuilds(1);
  }
});

