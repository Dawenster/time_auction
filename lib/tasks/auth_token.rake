desc "Add auth token to users without one"

task :fill_auth_tokens => :environment do
  User.all.map do |u|
    u.generate_token(:auth_token)
    u.save!
  end
end

