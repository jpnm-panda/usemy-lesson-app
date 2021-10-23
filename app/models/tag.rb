# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
    # 複数のboard_tag_relations model のオブジェクトとの紐付けを設定している
    has_many :board_tag_relations, dependent: :delete_all

    # board_tag_relations model を介して、複数のboard model のオブジェクトとの紐付けを設定している
    has_many :boards, through: :board_tag_relations
end
