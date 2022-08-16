class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_post_images, through: :favorites, source: :post_image
  has_one_attached :profile_image

  #フォローしている
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
                                                                     #自分
  #フォローされている
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
                                                                  #foreign_key=自分

  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower



  # フォローしたときの処理
    def follow(user_id)
      relationships.create!(followed_id: user_id)
                            #相手
    end
    # フォローを外すときの処理
    def unfollow(user_id)
      relationships.find_by!(followed_id: user_id).destroy
                            #相手
    end
    # フォローしているか判定
    def follower?(current_user)
      followers.include?(current_user)
    end

    def own?(object)
    id == object.user_id
    end

    def favorited_by?(post_image)
      #if post_image_id == current_user.post_image_id
      favorites.where(post_image_id: post_image_id).exists?
      #else
      #end
    end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [100,100]).processed
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
end
