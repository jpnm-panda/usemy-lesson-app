class CommentsController < ApplicationController
  def create
      comment = Comment.new(comment_params) # board_id からboard オブジェクトと関連付けられたcomment オブジェクトを作成する
      if comment.save
        flash[:notice] = 'コメントを投稿しました'

        redirect_to comment.board # comment オブジェクトに対応した、board_id を取得し紐付いているboard オブジェクトへ遷移させる
      else
        redirect_back fallback_location: root_path, flash: {
          comment: comment,
          error_messages: comment.errors.full_messages
        }
        
      end
  end

  def destroy
    comment = Comment.find(params[:id]) # id から削除するcomment オブジェクトを呼び出しcomment に代入する
    comment.delete
    redirect_to comment.board, flash: { notice: 'コメントが削除されました'}
  end

  private

  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment)
  end

end
