class Product < ActiveRecord::Base
    before_validation :generate_slug

 
	validates :name, presence: true, uniqueness: true
	validates :slug, uniqueness: true

	validates :description, length: {maximum: 570}



	do_not_validate_attachment_file_type :image
	has_attached_file :image
#	validates_attachment :image, 
#	:content_type => { :content_type => ['image/jpeg', 'image/png'] },
#	:size => { :less_than => 10.megabyte }


#    do_not_validate_attachment_file_type :picture
    has_attached_file :picture 
    has_attached_file :picture1
    has_attached_file :picture2
    has_attached_file :picture3
    has_attached_file :picture4
    has_attached_file :picture5
    has_attached_file :picture6
    has_attached_file :picture7
    has_attached_file :picture8
    has_attached_file :picture9

#    :styles => {
#      :thumb=> "100x100>",
#      :small  => "150x150>",
#      :medium => "300x300>",
#      :large =>   "400x400>", 
#      :gallery => "500x500>" }
#  validates_attachment :picture, content_type: { content_type: ["picture/jpg", "picture/jpeg", "picture/png", "picture/gif"] }




    has_many :clocks, dependent: :destroy
    has_many :clockers, through: :clocks, source: :user

    has_many :categorizations, dependent: :destroy
    has_many :categories, through: :categorizations

#   has_many :pictures, dependent: :destroy

    scope :trending, -> { joins(:clocks).group("#{Product.table_name}.id").where("releasing_on > ?", Date.current).order("count(clocks.product_id) desc").order("name") }
    scope :upcoming, -> { where("releasing_on > ?", Date.current).order("releasing_on").order(:name) }
    scope :past, -> { where("releasing_on <= ?", Date.current).order("releasing_on desc").order(:name) }
	scope :tba, -> { where(releasing_on: nil).order('random()') }
	scope :newest, -> { all.order("id desc") }

    scope :future, -> { where("releasing_on > ?", Date.current).order("releasing_on").order(:name) }
    scope :before, -> { where("releasing_on <= ?", Date.current).order("releasing_on desc").order(:name) }
    scope :unknown, -> { where(releasing_on: nil).order('random()') }




	def tbd?
		price.blank? || price.zero? 
	end

	def tba?
		releasing_on.blank?
	end

	def out?
		releasing_on <= Date.current
	end		

	def to_param
		slug
	end

	def generate_slug
		self.slug ||= name.parameterize if name
	end

end


