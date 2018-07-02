class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }
  validates :released, inclusion: { in: [true, false] }
  validates :released, exclusion: { in: [nil] }
  validates :release_year, presence: false, if: :not_released?
  validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.current.year }, unless: :not_released?
  validates :artist_name, presence: true

  def not_released?
    released == false
  end

end
