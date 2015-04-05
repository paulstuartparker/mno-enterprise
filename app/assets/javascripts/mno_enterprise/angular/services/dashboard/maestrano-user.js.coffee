angular.module('maestrano.services.dashboard.user', []).factory('DashboardUser', ['$http','$q', ($http,$q) ->
  # Init
  service = {}

  service.update = (data) ->
    return $http.put("/jpi/v1/current_user",{user:data})

  service.updatePassword = (newPassword,confirmPassword,currentPassword) ->
    return $http.put("/auth/users/update_password",{ user: {
      password: newPassword,
      password_confirmation: confirmPassword,
      current_password: currentPassword
    } })

  service.deletionRequest = ->
    return $http.post("/deletion_requests")

  service.cancelDeletionRequest = (token) ->
    return $http.delete("/deletion_requests/#{token}")

  service.resendDeletionRequest = (token) ->
    return $http.put("/deletion_requests/#{token}/resend")


  return service

])