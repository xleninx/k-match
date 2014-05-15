$(function(){

  $('.cancel-account').on('click',function(e) {
    if (!confirm('you are sure to cancel the account and all associated data?')){
      e.preventDefault();
    }
  });
})
