require File.dirname( __FILE__ ) + '/lib/ey_logger'
require File.dirname( __FILE__ ) + '/lib/ey_logger_hooks'
require File.dirname( __FILE__ ) + '/recipes/database'
require File.dirname( __FILE__ ) + '/recipes/ferret'
require File.dirname( __FILE__ ) + '/recipes/mongrel'
require File.dirname( __FILE__ ) + '/recipes/nginx'
require File.dirname( __FILE__ ) + '/recipes/slice'
require File.dirname( __FILE__ ) + '/recipes/deploy'
require File.dirname( __FILE__ ) + '/recipes/sphinx'
require File.dirname( __FILE__ ) + '/recipes/backgroundrb'
require File.dirname( __FILE__ ) + '/recipes/memcached'
require File.dirname( __FILE__ ) + '/recipes/solr'
require File.dirname( __FILE__ ) + '/recipes/monit'
require File.dirname( __FILE__ ) + '/recipes/tomcat'
require File.dirname( __FILE__ ) + '/recipes/juggernaut'
require File.dirname( __FILE__ ) + '/recipes/passenger'
require File.dirname( __FILE__ ) + '/recipes/apache'
require File.dirname( __FILE__ ) + '/recipes/unicorn'

Capistrano::Configuration.instance(:must_exist).load do
  default_run_options[:pty] = true if respond_to?(:default_run_options)
  set :keep_releases, 3
  set :runner, defer { user }
end
