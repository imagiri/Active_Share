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
//= require jquery/dist/jquery.js
//= require bootstrap/dist/js/bootstrap.min
//= require rails-ujs
//= require activestorage
//= require diaries.coffee
//= require diaries.js
//= require users.js
//= require jquery-ui
//= require tag-it
//= require_tree .

$(function(){
  $fileField = $('#icon')

  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#icon_view");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "icon",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

$(function(){
  $fileField = $('#back_icon')

  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#back_icon_view");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "user-show-top",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

$(function(){
  $fileField = $('#main_image')

  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#main_image_view");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "back-icon",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

$(function() {
  $("#sub_image_view").after('<span class="sub"></span>');
  // 条件にあったものを上記の位置に表示する

  // アップロードするファイルを複数選択
  $('input[multiple=multiple]').change(function() {
    $('.sub').html('');
    var file = $(this).prop('files');

    var img_count = 1;
    $(file).each(function(i) {
      // 5枚まで
      if (img_count > 5) {
        return false;
      }

      if (! file[i].type.match('image.*')) {
        $(this).val('');
        $('.sub').html('');
        return;
      }

      var reader = new FileReader();
      reader.onload = function() {
        var img_src = $('<img class="sub-images">').attr('src', reader.result);
        $('.sub').append(img_src);
      }
      reader.readAsDataURL(file[i]);

      img_count = img_count + 1;
    });
  });
});


$(document).ready(function(){
    $(".img-group").colorbox({
      rel:'img-group',
    });
});
