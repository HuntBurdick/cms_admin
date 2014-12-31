class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :slug
      t.string :name
      t.text :body
      t.attachment :image
      t.boolean :published, :boolean, :default => true
      t.boolean :show_in_menu, :boolean, :default => true
      t.boolean :only_for_logged_in_members, :default => false
      t.integer :position
      t.timestamp :created_on
      t.timestamp :updated_on
    end
    Page.create :name => 'Home', :body => 'Welcome to cms_admin', :position => 1
    add_index :pages, :slug, unique: true
  end
end