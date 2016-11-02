# == Schema Information
#
# Table name: roles
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  resource_id   :integer
#  resource_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_roles_on_name                                    (name)
#  index_roles_on_name_and_resource_type_and_resource_id  (name,resource_type,resource_id)
#

module RolesHelper
  ROLE_NAMES = {
    'super_admin'              => '超级管理员',
    'content_admin' => '内容管理员',
    'link_admin' => '链接管理员'
  }

  def regular_role_names
    ROLE_NAMES #.reject { |key, value| key == 'super_admin' }
  end
end
