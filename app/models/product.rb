class Product < ActiveRecord::Base
    before_validation :generate_slug


	validates :name, presence: true, uniqueness: true
	validates :slug, uniqueness: true

	validates :description, length: {maximum: 800}


#	validates :image_file_name, allow_blank: true, format: {
# 	 with:    /\w+.(gif|jpg|png)\z/i,
# 	 message: "must reference a GIF, JPG, or PNG image"
#	}


	do_not_validate_attachment_file_type :image

#	validates_attachment :image, 
#	:content_type => { :content_type => ['image/jpeg', 'image/png'] },
#	:size => { :less_than => 10.megabyte }


	has_attached_file :image


    has_many :clocks, dependent: :destroy
    has_many :clockers, through: :clocks, source: :user

    has_many :categorizations, dependent: :destroy
    has_many :categories, through: :categorizations


	scope :trending, -> { where("releasing_on >= ?", Time.now).order("releasing_on").order(:name) }
    scope :upcoming, -> { where("releasing_on >= ?", Time.now).order("releasing_on").order(:name) }
    scope :past, -> { where("releasing_on <= ?", Time.now).order("releasing_on desc").order(:name) }
	scope :tba, -> { where(releasing_on: nil).order(:name) }


	def tbd?
		price.blank? || price.zero? 
	end

	def tba?
		releasing_on.blank?
	end

	def out?
		releasing_on < Time.now
	end		

	def to_param
		slug
	end

	def generate_slug
		self.slug ||= name.parameterize if name
	end

#	def total_clocks
#		clocks.size = total_clocks
#	end 

end
