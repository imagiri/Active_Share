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
