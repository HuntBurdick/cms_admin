
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

    def add_cms_sections
      # Add Migrations
      create_file "db/migrate/#{Time.now.year}#{Time.now.to_i}_create_cms_sections.rb", <<-FILE
        class CreateCmsSections < ActiveRecord::Migration[6.0]
          def change
            create_table :cms_sections do |t|
              t.string :generated_model_name
              t.string :generated_controller_name
              t.boolean :show_in_admin_nav, default: true
              t.text :description
              t.timestamps null: false
            end
          end
        end
      FILE

      # Add Model
      template "models/cms_sections.erb", "app/models/cms_section.rb"
    end

    # WIP: Not sure best way to include js yet..
    def add_javascript_pack
      inject_into_file "app/views/layouts/application.html.erb", before: "</head>\n" do <<-'RUBY'
        <%= yield :cms_admin_javascript %>
      RUBY
      end
    end
  end
end
