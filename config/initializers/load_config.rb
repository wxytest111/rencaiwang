APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]
PAPERCLIP_CONFIG = YAML.load_file("#{Rails.root}/config/paperclip.yml")[Rails.env]

