class CommentsController < ApplicationController
  def create
      comment = Comment.new(comment_params) # board_id からboard オブジェクトと関連付けられたcomment オブジェクトを作成する
      if comment.save
        flash[:notice] = 'コメントを投稿しました'

        redirect_to comment.board # comment オブジェクトに対応した、board_id を取得し紐付いているboard オブジェクトへ遷移させる
      else
        redirect_to :back, flash: {
          comment: comment,
          error_messages: comment.errors.full_messages
        }
      end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment)
  end

end
