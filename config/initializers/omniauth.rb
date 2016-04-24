Rails.application.config.middleware.use OmniAuth::Builder do
<<<<<<< HEAD
  provider :google_oauth2, Rails.application.secrets.google_client_id, Rails.application.secrets.google_client_secret,{
	:scope => 'email,profile'
}

end
=======
  provider :google_oauth2, ENV["576625713946-rp1vt7ufuo1p6apig6adkcnstnku8nbb.apps.googleusercontent.com"], ENV["_rnhhpMg8KlAK6a9sU54fg4P "],
    {
      :name => "google",
      :scope => "email, profile, plus.me, http://gdata.youtube.com",
      :prompt => "select_account",
      :image_aspect_ratio => "square",
      :image_size => 50
    }
end
>>>>>>> eaa9087365a64842869af70530fded8fdea6e229
