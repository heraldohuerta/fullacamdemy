// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
// <% self.class.include Rails.application.routes.url_helpers %>


$( document ).on('turbolinks:load', function() {

  $('#curso').on('click', function()
  {
    var course_id = $(this).find(":selected").val();
    $.post("tests/completarasignatura",{course_id: course_id});
  });

  $('#asignatura').on('click', function()
  {
    var asignatur_id = $(this).find(":selected").val();
    $.post("tests/completarcontenido",{asignatur_id: asignatur_id});
  })

  $('#contenido').on('click', function()
  {
    var content_id = $(this).find(":selected").val();

    $.post("tests/completarprueba",{content_id: content_id});
  })


  $('#listest').change( function()
    {
      var test_id = $(this).find(":selected").val();
      $.post("tests/buscarprueba",{test_id: test_id});
    })




});
