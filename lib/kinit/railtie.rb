require 'kinit'
require 'rails'
module Kinit
  class Railtie < Rails::Railtie
    railtie_name :kinit_enforcer

    rake_tasks do
      load "tasks/kinit_enforcer.rake"
    end
  end
end
