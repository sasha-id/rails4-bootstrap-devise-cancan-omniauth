AppConfig = YAML.load(File.open "#{Rails.root}/config/config.yml")[Rails.env].to_hashugar
