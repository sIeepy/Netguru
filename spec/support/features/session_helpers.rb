module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit new_user_registration_path
      fill_in 'Name', with: name
      fill_in 'Email', with: email
      fill_in 'user_password', with: password
      fill_in 'Password confirmation', with: password
      within(".form-actions") do
        click_on 'Sign up'
      end
    end

    def sign_in(*)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    def logout
      click_on 'Logout'
    end

    def visit_movie_page
      visit '/movies/' + movie.id.to_s
    end

    def create_comment
      fill_in 'comment_text', with: Faker::Lorem.sentence
      click_button 'Create comment'
    end
  end
end
