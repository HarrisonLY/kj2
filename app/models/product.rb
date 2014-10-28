class Product < ActiveRecord::Base
    before_validation :generate_slug


	validates :name, presence: true, uniqueness: true
	validates :slug, uniqueness: true

	validates :description, length: {maximum: 1000}

	validates :image_file_name, allow_blank: true, format: {
 	 with:    /\w+.(gif|jpg|png)\z/i,
 	 message: "must reference a GIF, JPG, or PNG image"
	}


 
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

	def to_param
		slug
	end

	def generate_slug
		self.slug ||= name.parameterize if name
	end


	#def self.tba
	#	where("releasing_on = ?").order("name")
	#end

	#def self.upcoming
	#	where("releasing_on >= ?", Time.now).order("releasing_on").order("name")
	#end

	#def self.just_released
	#	where("releasing_on <= ?", Time.now).order("releasing_on").order("name")
	#end


end
