# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

parent_categories = Category.create([
                                        {title: '研究院介绍', status: 'on_menu', on_left: 0, priority: 1},
                                        {title: '新闻中心', status: 'on_menu', on_left: 0, priority: 2},
                                        {title: '政策研究', status: 'on_menu', on_left: 0, priority: 3},
                                        {title: '管理咨询', status: 'on_menu', on_left: 0, priority: 4},
                                        {title: '人才培训', status: 'on_menu', on_left: 0, priority: 5},
                                        {title: '高层次人才', status: 'on_menu', on_left: 0, priority: 6},
                                        {title: '网站介绍', status: 'online', on_left: 0, priority: 7},
                                        {title: '通知公告', status: 'online', on_left: 0, priority: 8},
                                    ])
categories = Category.create([
                                 {title: '发展改革',    status: 'on_menu', on_left: 0, priority: 1, parent_id: parent_categories[0].id},
                                 {title: '机构设置',    status: 'on_menu', on_left: 0, priority: 2, parent_id: parent_categories[0].id},
                                 {title: '现任领导',    status: 'on_menu', on_left: 0, priority: 3, parent_id: parent_categories[0].id},
                                 {title: '研究队伍',    status: 'on_menu', on_left: 0, priority: 4, parent_id: parent_categories[0].id},
                                 {title: '所获荣誉',    status: 'on_menu', on_left: 0, priority: 5, parent_id: parent_categories[0].id},
                                 {title: '通知公告',    status: 'on_menu', on_left: 0, priority: 1, parent_id: parent_categories[1].id},
                                 {title: '综合新闻',    status: 'on_menu', on_left: 0, priority: 2, parent_id: parent_categories[1].id},
                                 {title: '人才工作专题', status: 'on_menu', on_left: 0, priority: 3, parent_id: parent_categories[1].id},
                                 {title: '宏观政策',    status: 'on_menu', on_left: 0, priority: 1, parent_id: parent_categories[2].id},
                                 {title: '陕西省人才政策', status: 'on_menu', on_left: 0, priority: 2, parent_id: parent_categories[2].id},
                                 {title: '理论研究',    status: 'on_menu', on_left: 0, priority: 3, parent_id: parent_categories[2].id},
                                 {title: '业务简介',    status: 'on_menu', on_left: 0, priority: 1, parent_id: parent_categories[3].id},
                                 {title: '业绩成果',    status: 'on_menu', on_left: 0, priority: 2, parent_id: parent_categories[3].id},
                                 {title: '典型案例',    status: 'on_menu', on_left: 0, priority: 3, parent_id: parent_categories[3].id},
                                 {title: '创业人才培训', status: 'on_menu', on_left: 0, priority: 1, parent_id: parent_categories[4].id},
                                 {title: '院士工作',    status: 'on_menu', on_left: 0, priority: 1, parent_id: parent_categories[5].id},
                                 {title: '高层次人才工作联谊会', status: 'on_menu', on_left: 0, priority: 1, parent_id: parent_categories[5].id},
                                 {title: '网站介绍',    status: 'online', on_left: 0, priority: 1, parent_id: parent_categories[6].id},
                                 {title: '通知',    status: 'online', on_left: 0, priority: 1, parent_id: parent_categories[7].id},
                                 {title: '公告',    status: 'online', on_left: 0, priority: 2, parent_id: parent_categories[7].id},
                             ])

regions = Region.create([
                            {name: '全国', priority: 0},
                            {name: '外省', priority: 1},
                            {name: '陕西', priority: 2},
                            {name: '地市', priority: 3},
                            {name: '区县', priority: 4}
                        ])
[{name: '超级管理员', email: '30540047@qq.com', password: 'wangxinyu'}, {name: '张老师', email: '13609118917', password: '13609118917'}].each do |user_info|
  super_admin = User.new(user_info)
  super_admin.add_role :super_admin
  super_admin.regions = regions
  super_admin.categories = categories
  super_admin.save!
end

content_admin = User.new(name: '内容管理员', email: '18601357901', password: '18601357901')
content_admin.add_role :content_admin
content_admin.regions = regions
content_admin.categories = categories
content_admin.save!

random = Random.new
(1..400).to_a.each do |n|
  article = Article.new(
      {
          title: "陕西省青年人才座谈会第#{n}次会议",
          content: '<p><img alt="" src="http://xiaochubang.oss-cn-qingdao.aliyuncs.com/6.jpg" style="width: 877px; height: 292px;" />&nbsp;</p>
                    <p>新闻事件发生时，人们不再万人空巷地集中在电视屏幕前，而是迅速掏出手机打开社交网络，一秒钟评论、转发、扩散，甚至人人都能够手持麦克风面对手机摄像头来上一段现场直播……这是一个信息网络和数字技术裂变式发展的时代，并且这“裂变”的速度，已然超出想象。

　　传统媒体正在被颠覆，新的媒体格局却尚未形成。变革的时代，对媒体行业来说，是最坏的时代，还是最好的时代？

　　在这样风卷云涌的变革之下，多样的趋势迅疾的变化越来越汇聚出一个共同的特点：智能终端的发展普及和碎片化信息的海量铺展让低头族群体越来越庞大——360度包裹式的信息，让“浸媒体”这个新词汇呼之欲出。没错，浸媒体，这也是今年新浪未来媒体峰会锁定的</p>
                    <p>6位中青年人才畅谈创新创业的经验和体会&nbsp;</p>'
      }
  )
  article.user = content_admin
  article.region = regions[random.rand(regions.length)]
  article.category = categories[random.rand(categories.length)]
  article.is_recommand = random.rand(2)
  article.is_picture = random.rand(2)
  article.status = 1
  article.save!
end

