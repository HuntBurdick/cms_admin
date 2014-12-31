class Post < ActiveRecord::Base
	validates :title, :body, :page_id, presence: true

	acts_as_list
	belongs_to :page
	has_many :images

	accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true

	has_attached_file :image, :styles => { :normal => "800x800>", :thumb => "250x250#" }, :default_url => "http://placehold.it/500x500"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  extend FriendlyId
  	friendly_id :title, use: :slugged
end
