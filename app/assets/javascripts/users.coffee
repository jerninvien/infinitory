jQuery ->
  $('body').tooltip({ selector: "[data-toggle~='tooltip']"})
  
  $('#inner-form input').prop('disabled', true)

  $('#user_password').focus ->
    $('.user_password_confirmation').show()

  # $('.GLform').removeClass('hidden') if $('#user_role').val() is "group_leader"
  # $('.GLform').addClass('hidden') if $('#user_role').val() isnt "group_leader"

  $('.lab_members_form').removeClass('hidden') if $('#user_role').val() isnt "group_leader"
  $('.lab_members_form').addClass('hidden') if $('#user_role').val() is "group_leader"

	$('#user_role').change ->
    form_reactions = ->
      $('.GLform').removeClass('hidden') and $('#user_lab_email').val([""]) if $('#user_role').val() is "group_leader"
      $('.GLform').addClass('hidden') and $('#user_institute_name').val([""]) and $('#user_department_id').val([""]) if $('#user_role').val() isnt "group_leader"

      $('.lab_members_form').removeClass('hidden') if $('#user_role').val() isnt "group_leader"
      $('.lab_members_form').addClass('hidden') if $('#user_role').val() is "group_leader"

      $('#GL_INFO').slideDown('fast') if $('#user_role').val() is "group_leader"
      $('#GL_INFO').slideUp('fast') if $('#user_role').val() isnt "group_leader"


    $('#inner-form input').prop(
      'disabled', false
      form_reactions()
      ) if $('#user_role').val() isnt ""

    $('#inner-form input').prop(
      'disabled', true
      form_reactions()
      ) if $('#user_role').val() is "" 

		

      
  

  