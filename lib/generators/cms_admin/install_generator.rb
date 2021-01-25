
require "rails/generators"

module CmsAdmin
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../../templates', __FILE__)

    def create_initializer_file
      create_file "config/initializers/cms_admin_initializer.rb", "# Add initialization content here"
    end

    def add_admin_controller
      template "controllers/admin_controller.erb", "app/controllers/admin_controller.rb"
    end
  end
end
