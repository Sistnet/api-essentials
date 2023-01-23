# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Criando Politicas de Grupo e Permissionamento

GroupPolicy.find_or_create_by!(name: 'Admin', user_type: :admin_user)
admin_group = GroupPolicy.find_by(user_type: :admin_user)
## add permissão users aos admins

Permission.find_or_create_by!(resource: :user) do |permission|
  permission.group_policies << admin_group
end

admin_group.reload

# cria usuário admin
admin_user = AdminUser.find_or_create_by!(first_name: 'Admin', last_name: 'User', email: 'admin@dev.com') do |user|
  user.password = 'teste1234'
end

admin_user.permissions << admin_group.permissions