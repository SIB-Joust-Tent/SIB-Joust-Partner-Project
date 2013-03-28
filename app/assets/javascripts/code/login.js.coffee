jQuery ->
  # For some reason, converting this to Angular does not work. The $http post isn't 
  # working the same as the $.ajax post oddly...
  navigator.id.watch({
    loggedInUser: window.currentUser,
    onlogin: (assertion) ->
      # A user has logged in! Here you need to:
      # 1. Send the assertion to your backend for verification and to create a session.
      # 2. Update your UI.
      $.ajax({ 
        type: 'POST',
        url: '/users/sign_in', 
        data: {assertion: assertion},
        success: (res, status, xhr) ->
          window.location.reload()
        error: (xhr, status, err) ->
          navigator.id.logout()
          alert("Login failure: " + err)
      })
    onlogout: () ->
      # A user has logged out! Here you need to:
      # Tear down the user's session by redirecting the user or making a call to your backend.
      # Also, make sure loggedInUser will get set to null on the next page load.
      $.ajax({
        type: 'POST',
        url: '/users/sign_out',
        data: {'_method': 'delete'},
        success: (res, status, xhr) ->
          window.location.reload()
        error: (xhr, status, err) ->
          alert("Logout failure: " + err)
      })
  })