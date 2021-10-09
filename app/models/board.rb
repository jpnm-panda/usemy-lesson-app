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
    has_many :comments

    # 必ず値が入力されること、最大文字数以下であることを確認するバリデーション
    validates :name, presence: true, length: { maximum: 10 }
    validates :title, presence: true, length: { maximum: 30 }
    validates :body, presence: true, length: { maximum: 1000 }
end
