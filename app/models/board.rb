# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  name       :string
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
    
    # 複数のcomment model のオブジェクトと関連を持たせるための設定
    has_many :comments, dependent: :delete_all

    # 複数のtag model のオブジェクトとの紐付けを設定している
    has_many :board_tag_relations, dependent: :delete_all
    
    # board_tag_relations model を介して、複数のtag model のオブジェクトとの紐付けを設定している
    has_many :tags, through: :board_tag_relations

    # 必ず値が入力されること、最大文字数以下であることを確認するバリデーション
    validates :name, presence: true, length: { maximum: 10 }
    validates :title, presence: true, length: { maximum: 30 }
    validates :body, presence: true, length: { maximum: 1000 }
end
