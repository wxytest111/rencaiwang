desc 'clear data from db'
task clear_data_from_db: :environment do |_|
  Article.delete_all
  UserRegion.delete_all
  UserCategory.delete_all
  User.delete_all
  Region.delete_all
  Category.delete_all
  Link.delete_all
end