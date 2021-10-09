class Board < ApplicationRecord
    # 必ず値が入力されること、最大文字数以下であることを確認するバリデーション
    validates :name, presence: true, length: { maximum: 10 }
    validates :title, presence: true, length: { maximum: 30 }
    validates :body, presence: true, length: { maximum: 1000 }
end
