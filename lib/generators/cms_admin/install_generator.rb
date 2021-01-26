
require "rails/generators"

module CmsAdmin
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../../templates', __FILE__)

    def add_admin_route
      route "get 'admin', to: 'admin#index'"
    end

    def create_initializer_file
      create_file "config/initializers/cms_admin_initializer.rb", "# Add initialization content here"
    end

    def add_admin_controller_and_view
      template "controllers/admin_controller.erb", "app/controllers/admin_controller.rb"
      template "views/admin/index.html.erb", "app/views/admin/index.html.erb"
    end

    def add_admin_stylesheet
      template "stylesheets/admin/cms_admin.css", "app/assets/stylesheets/cms_admin.css"
    end

    def add_javascript_pack
      # rake "webpacker:install"
      rake "yarn:install"

      template "javascript/admin/cms_admin.js", "app/javascript/packs/cms_admin.js"

      append_to_file "config/initializers/assets.rb" do <<-'RUBY'
        Rails.application.config.assets.precompile += %w( cms_admin.js )
      RUBY
      end

      inject_into_file "app/views/layouts/application.html.erb", before: "</head>\n" do <<-'RUBY'
        <%= javascript_include_tag 'cms_admin' %>
      RUBY
      end
    end
  end
end
