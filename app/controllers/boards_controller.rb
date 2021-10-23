class BoardsController < ApplicationController

    # メソッドの実行前に、引数にキーの形で設定したメソッドを使用する（only制約で絞り込みもできる）
    before_action :set_target_board, only: %i[show edit update destroy]

    # index.html.erb で表示するために、Board Class からインスタンスを作成し、@boards に代入にしている
    def index
        @boards = Board.page(params[:page]) # page method でデフォルトで設定された値だけが引数に渡る
    end

    # new.html.erb で入力を行うために、Board Class からインスタンスを作成し、@board に代入にしている
    def new
        @board = Board.new
    end

    # Board Class のcreate method で引数(board_params) に渡された値を元にオブジェクトを作成している
    def create
        board = Board.new(board_params) # リダイレクトに必要な/board/:id を作成するための値をboard に格納している

        if board.save # board オブジェクトを使い保存を行い、結果がBoolean で返される
            flash[:notice] = "「#{board.title}」の掲示板を作成しました" # flash 変数にフラッシュメッセージ用のテキストを格納する
            
            redirect_to board
        else
            # board からどの値がバリデーションにひかかったのかを補足し、内容をerror_messages の配列に格納する
            redirect_to new_board_path, flash: {
                board: board,
                error_messages: board.errors.full_messages
            }
        end
    end

    def show
        @comment = Comment.new(board_id: @board.id) # 掲示板詳細ページを開いた段階で、保存されているboard オブジェクトのboard_id に紐づくcomment オブジェクトを作成し@comment に格納する
    end

    def edit
        @board = Board.find(params[:id])
    end

    # set_target_board method を使うので、変数は@board に置き換える
    def update
        if @board.update(board_params)
            flash[:notice] = "「#{@board.title}」の掲示板の内容を更新しました"
            
            redirect_to @board
        else
            # @board からどの値がバリデーションにひかかったのかを補足し、内容をerror_messages の配列に格納する
            redirect_back fallback_location: root_path, flash: {
                board: @board,
                error_messages: @board.errors.full_messages
            }
        end
    end

    def destroy
        @board.destroy # dependent option を使いたいのでdestroy method におきかえる

        # リダイレクトが行われた時、flash 変数にフラッシュメッセージ用のテキストを格納する
        redirect_to @board, flash: { notice: "「#{@board.title}」の掲示板を削除しました" }
    end

    # private method を使って設定したmethod はストロングパラメーターズとして、params の中の特定の値を格納できる
    private

    # 変数params の中のkey をrequire method で指定し、key の中で許可する値をpermit method で指定している
    def board_params
        params.require(:board).permit(:name, :title, :body, tag_ids: [])
        
    end

    #  find method でリクエストされたid に対応する掲示板の値をparams[:id] で抽出し、@board に代入している
    def set_target_board
        @board = Board.find(params[:id])
    end
end
