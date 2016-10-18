# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += [
    'ckeditor/*',
    'jquery.js',
    'jquery_ujs.js',
    'categories.js',
    'categories.css',
    'regions.js',
    'regions.css',
    'users.js',
    'users.css',
    'articles.js',
    'articles.css',
    'sessions.css',
    'sessions.js',
    'welcome.js',
    'welcome.css',
    'links.js',
    'links.css',
    'member/style.css',
    'member/public.css',
    'templates/style_2_common.css',
    'templates/style_2_widthauto.css',
    'templates/index.css',
    'templates/common.css',
    'templates/ajax.js',
    'templates/common.js',
    'templates/common_extra.js',
    'templates/discuz_tips.js',
    'templates/portal.js',
    'templates/jquery.SuperSlide.2.1.1.js'
]
