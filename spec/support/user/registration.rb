def register(user)
  visit(new_user_registration_path)
  within("#new_user") do
    fill_in 'user[email]', :with => user.email
    fill_in 'password', :with => user.password
    fill_in 'Confirm password', :with => user.password
  end
  click_on 'NEXT'
end
def login(email,password)
  visit(new_user_session_path)
  within("#new_user") do
    fill_in 'user[email]', :with => email
    fill_in 'user[password]', :with => password
  end
  click_on 'LOG IN TO MY ACCOUNT'
end

def logout
  click_on "LOGOUT"
end