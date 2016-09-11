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
                                 {title: '典型事迹', status: 'online', on_left: 0},
                                 {title: '农村实用人才', status: 'online', on_left: 0},
                                 {title: '评论报道', status: 'online', on_left: 1},
                                 {title: '公告栏', status: 'online', on_left: 0}
                             ])

regions = Region.create([
                          {name: '全国'},
                          {name: '外省'},
                          {name: '陕西'},
                          {name: '地市'},
                          {name: '区县'}
                        ])

super_admin = User.new(name:'超级管理员', email:'30540047@qq.com', password:'wangxinyu')
super_admin.add_role :super_admin
super_admin.regions = regions
super_admin.save!

content_admin = User.new(name:'内容管理员', email:'18601357901', password:'18601357901')
content_admin.add_role :content_admin
content_admin.regions = regions
content_admin.save!

random = Random.new
(1..200).to_a.each do |n|
  article = Article.new({title: "文章#{n}的标题", content:"文章#{n}的内容"})
  article.region = regions[random.rand(regions.length)]
  article.category = categories[random.rand(categories.length)]
  article.save!
end

