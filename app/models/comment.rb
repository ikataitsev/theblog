class Comment < ActiveRecord::Base
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ } # stolen from devise
  belongs_to :article, dependent: :destroy
end
