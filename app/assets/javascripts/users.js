# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


 $(document).on 'turbolinks:load', ->

   readURL = (input) ->
     if input.files
       reader = new FileReader

       reader.onload = (e) ->
         $('#icon_img_prev').attr 'src', e.target.result
         return

       reader.readAsDataURL input.files[0]
     return

   $('#user_img').change ->
     readURL this
     return
   return
