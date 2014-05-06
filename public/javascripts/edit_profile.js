$(function(){
  $('.chosen-select').chosen({max_selected_options: 3});

  $('#state_select').on('change',function() {
    country_id = $(this).val();
    check_select( country_id );
  });

  $('#edit_profile').on('submit',function(){
    $('.hidden').remove();
  });

  function check_select (country_id) {
    if (country_id == 2067 || country_id == 2068){
      $('#state').removeClass('hidden');
      $('#state_text').addClass('hidden');
    }else{
      $('#state_text').removeClass('hidden');
      $('#state').addClass('hidden');
    }
  }

  check_select($('#state_select').val());

})
