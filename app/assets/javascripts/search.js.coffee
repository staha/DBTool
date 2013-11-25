$ ->
   $('.datepicker').datepicker
     format: 'yyyy-mm-dd'
   .on 'changeDate', ->
     $('.datepicker').datepicker('hide')