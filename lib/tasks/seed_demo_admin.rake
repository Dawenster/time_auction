desc "Seeds a demo admin (for opensource forks)"

task :seed_demo_admin => :environment do
  User.create!(
  name: "Danny Aidemin",
  email: "test@example.com",
  password: "heyimdanny",
  phone: "999-999-9999",
  time_donated: 55,
  admin: true)
end
