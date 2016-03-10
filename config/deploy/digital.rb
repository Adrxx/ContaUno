 set :ssh_options, {
  keys: %w(/Users/Adrian/.ssh/id_rsa),
  forward_agent: true,
  auth_methods: %w(publickey password)
 }

server '104.236.63.125', user: 'root', roles: %w{rootr}