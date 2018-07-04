class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates :genre, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?
  validate :valid_year

  def released?
    released == true
  end

  def valid_year
    if release_year
      if release_year > 2018
        errors.add(:release_year, "year cannot be in the future")
      end
    end
  end

end #class end
