$(document).ready(function() {

  if ($('#show_software_details').length > 0) {
    $('#software_detail_panel').hide();
    $('#show_software_details').click(function() {
      $('#software_detail_panel').toggle();
      });
  };

});
