require "rails/generators"

module CmsAdmin
  class SectionGenerator < ::Rails::Generators::NamedBase
    source_root File.expand_path('../../templates', __FILE__)

    def copy_files
      # Add routes
      route "namespace :admin do
        resources :#{section_name}
      end"

      # Add Migrations
      create_file "db/migrate/#{Time.now.year}#{Time.now.to_i}_create_#{section_name}.rb", <<-FILE
        class Create#{section_controller_name} < ActiveRecord::Migration[6.0]
          def change
            create_table :#{section_name} do |t|
              t.string :name
              t.text :body
              t.timestamps null: false
            end
          end
        end
      FILE

      # Add Model
      template "models/section.erb", "app/models/#{section_name.singularize}.rb"

      # Add Controller
      template "controllers/section_controller.erb", "app/controllers/admin/#{section_name}_controller.rb"

      # Add Views
      template "views/section/_form.html.erb", "app/views/admin/#{section_name}/_form.html.erb"
      template "views/section/_list.html.erb", "app/views/admin/#{section_name}/_list.html.erb"
      template "views/section/edit.html.erb", "app/views/admin/#{section_name}/edit.html.erb"
      template "views/section/index.html.erb", "app/views/admin/#{section_name}/index.html.erb"
      template "views/section/new.html.erb", "app/views/admin/#{section_name}/new.html.erb"

      CmsSection.create(
        display_name: human_title,
        generated_model_name: section_model_name,
        generated_controller_name: file_name)
    end

    private
      # section_items
      def section_name
        file_name.underscore
      end

      # sectionItems
      def section_controller_name
        file_name.camelize
      end

      # SectionItem
      def section_model_name
        file_name.singularize.camelize
      end

      # Human readable title
      def human_title
        section_name.gsub('_', ' ').titleize
      end
  end
end
