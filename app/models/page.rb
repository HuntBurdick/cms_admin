class Page < ActiveRecord::Base
	acts_as_list
	validates :name, :presence => true, :uniqueness => true

	has_many :posts, dependent: :destroy
  has_many :images

  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true

	has_attached_file :image, :styles => { :normal => "800x800>", :thumb => "250x250#" }, :default_url => "http://placehold.it/500x500"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def label
  	"Pages"
  end

  def form_title
  	name.downcase.gsub(' ', '_')
  end

	extend FriendlyId
  	friendly_id :name, use: :slugged
end
