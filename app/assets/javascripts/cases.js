$(document).on('keypress', '#case_path', function(event) {
  if ( $('#case_path').val().match(/\\/) ) {
    $('#path_group').addClass('error');
  }
  else {
    $('#path_group').removeClass('error');
  }
});