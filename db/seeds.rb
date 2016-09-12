# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([
                                 {title: '新闻中心', status: 'on_menu', on_left: 0},
                                 {title: '领导讲话', status: 'on_menu', on_left: 0},
                                 {title: '宏观指导', status: 'on_menu', on_left: 1},
                                 {title: '政策文件', status: 'on_menu', on_left: 0},
                                 {title: '体制机制', status: 'on_menu', on_left: 0},
                                 {title: '院士工作', status: 'on_menu', on_left: 0},
                                 {title: '科技企业家', status: 'on_menu', on_left: 0},
                                 {title: '产学研人才', status: 'on_menu', on_left: 0},
                                 {title: '区域人才', status: 'on_menu', on_left: 0},
                                 {title: '人才计划', status: 'online', on_left: 1},
                                 {title: '典型事迹', status: 'online', on_left: 1},
                                 {title: '农村实用人才', status: 'online', on_left: 1},
                                 {title: '评论报道', status: 'online', on_left: 1},
                                 {title: '公告栏', status: 'online', on_left: 0}
                             ])

regions = Region.create([
                            {name: '全国', priority: 0},
                            {name: '外省', priority: 1},
                            {name: '陕西', priority: 2},
                            {name: '地市', priority: 3},
                            {name: '区县', priority: 4}
                        ])

super_admin = User.new(name: '超级管理员', email: '30540047@qq.com', password: 'wangxinyu')
super_admin.add_role :super_admin
super_admin.regions = regions
super_admin.save!

content_admin = User.new(name: '内容管理员', email: '18601357901', password: '18601357901')
content_admin.add_role :content_admin
content_admin.regions = regions
content_admin.save!

random = Random.new
(1..400).to_a.each do |n|
  article = Article.new(
      {
          title: "陕西省青年人才座谈会第#{n}次会议",
          content: '<p><img alt="" src="/ckeditor_assets/pictures/4/content._.png" style="width: 100px; height: 44px;" />&nbsp;</p>
                    <p>陕西省青年人才座谈会</p>
                    <p>6位中青年人才畅谈创新创业的经验和体会&nbsp;</p>'
      }
  )
  article.user = super_admin
  article.region = regions[random.rand(regions.length)]
  article.category = categories[random.rand(categories.length)]
  article.is_recommand = random.rand(2)
  article.is_picture = random.rand(2)
  article.save!
end

