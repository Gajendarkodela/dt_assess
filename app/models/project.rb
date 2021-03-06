class Project < ApplicationRecord
  has_many :project_modules, inverse_of: :project , dependent: :destroy

  validates :name, uniqueness: true,presence: true
  validates :ranking,uniqueness: true,presence: true, numericality: { greater_than:0 }

  def self.search(no_page,page)
      paginate(page: page, per_page:no_page || 9).order('ranking ASC') 
  end

end
