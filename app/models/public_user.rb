class PublicUser < ActiveRecord::Base
	acts_as_list

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	# has_attached_file :image, :styles => { :large => "800x800>", :medium => "250x250#", :thumb => "150x150#" }, :default_url => "/images/:style/missing.png"
 #  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  MODULE_TITLE    = 'Public_users'

  def label
  	'Public Users'
  end

  def form_title
  	name.downcase.gsub(' ', '_')
  end

end