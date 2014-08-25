Rapportive.configure do |config|
  config.method = :no_proxy
  #config.proxy = "proxy_ip:proxy_port" 

  #config.proxy_list = ["proxy_ip:proxy_port","proxy_ip:proxy_port"]
  #config.email_templates = ["%{fn}", "%{ln}"]
  config.timeout = 10
  config.full_body = false
end
