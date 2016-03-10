 set :ssh_options, {
  keys: %w(/Users/Adrian/.ssh/id_rsa),
  forward_agent: true,
  auth_methods: %w(publickey password)
 }

server 'nority.me', user: 'root', roles: %w{rootr}