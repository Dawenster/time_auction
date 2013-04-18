desc "Seeds initial TimeAuction admins (gitignore this)"

task :seed_admins => :environment do
  User.create!(
  name: "Kevin Ko",
  email: "enhasa@gmail.com",
  password: "thesickestdevs",
  phone: "999-999-9999",
  time_donated: 39,
  admin: true)

User.create!(
  name: "Philip Woo",
  email: "helpthebored@hotmail.com",
  password: "thesickestdevs",
  phone: "999-999-9999",
  time_donated: 76,
  admin: true)

User.create!(
  name: "David Wen",
  email: "dwen.fb@gmail.com",
  password: "thesickestdevs",
  phone: "999-999-9999",
  time_donated: 111,
  admin: true)

User.create!(
  name: "J Connolly",
  email: "jsconnolly@post.harvard.edu",
  password: "thesickestdevs",
  phone: "999-999-9999",
  time_donated: 66,
  admin: true)
end
