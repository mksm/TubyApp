WHITELIST_CONFIG = YAML.load_file("#{::Rails.root}/config/whitelist.yml")[::Rails.env]
