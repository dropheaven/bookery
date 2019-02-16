class Genre < ActiveRecord::Base
  has_many :books
  has_many :authors, -> { distinct }, through: :books

  before_validation :make_title_case
  validates :name, presence: true, uniqueness: true

  private
    def make_title_case
      # downcase first to avoid cases like "whaT IS this".titlecase => "Wha T Is This"
	    self.name = self.name.downcase.titlecase
    end
end