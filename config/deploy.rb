# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'conta_uno'
set :repo_url, 'git@github.com:Adrxx/ContaUno.git'

set :deploy_to, '/home/rails/'