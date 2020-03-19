class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :post_images, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

 # has_many :following_follows, foreign_key: "follower_id", class_name: "Follow", dependent: :destroy
 # has_many :followings, through: :following_follows, source: :follower

 # has_many :follower_follows, foreign_key: "following_id", class_name: "Follow", dependent: :destroy
 # has_many :followers, through: :follower_follows, source: :following

  has_many :follower, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy

  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower

  # has_many :received_follows, foreign_key: :following_id, class_name: "Follow"
  attachment :profile_image
  validates :name, presence: true, length: {minimum: 2, maximum: 20}
  validates :introduction, length: {maximum: 50}

  def following?(other_user)
    follower.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    follower.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    follower.find_by(followed_id: other_user.id).destroy
  end



  def self.search(method,search)
                if method == "forward_match"
                        @users = User.where("name LIKE?","#{search}%")
                elsif method == "backward_match"
                        @users = User.where("name LIKE?","%#{search}")
                elsif method == "perfect_match"
                        @users = User.where("name LIKE?","#{search}")
                elsif method == "partial_match"
                        @users = User.where("name LIKE?","%#{search}%")
                else
                        @users = User.all
                end
    end
end
