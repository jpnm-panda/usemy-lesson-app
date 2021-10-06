class BoardsController < ApplicationController

    # index.html.erb で表示するために、Board Class からインスタンスを作成し、@boards に代入にしている
    def index
        @boards = Board.all
    end

    # new.html.erb で入力を行うために、Board Class からインスタンスを作成し、@board に代入にしている
    def new
        @board = Board.new
    end

    # Board Class のcreate method で引数(board_params) に渡された値を元にオブジェクトを作成している
    def create
        board = Board.create(board_params) # リダイレクトに必要な/board/:id を作成するための値をboard に格納している
        redirect_to board
    end

    # find method でリクエストされたid に対応する掲示板の値をparams[:id] で抽出し、@board に代入している
    def show
        @board = Board.find(params[:id])
    end

    # find method でリクエストされたid に対応する掲示板の値をparams[:id] で抽出し、@board に代入している
    def edit
        @board = Board.find(params[:id])
    end

    # 変数は、表示させるView がない(他のファイルで呼び出さない)のでboard を使用する
    def update
        board = Board.find(params[:id])
        board.update(board_params)

        # redirect_to の後に指定したpath の画面に遷移させる
        redirect_to board
    end

    #  # find method でリクエストされたid に対応する掲示板の値をparams[:id] で抽出し、board に代入している
    def destroy
        board = Board.find(params[:id]) # リダイレクトとdelete method を使用するために必要な/board/:id を作成するための値をboard に格納している
        board.delete

        redirect_to board
    end

    # private method を使って設定したmethod はストロングパラメーターズとして、params の中の特定の値を格納できる
    private

    # 変数params の中のkey をrequire method で指定し、key の中で許可する値をpermit method で指定している
    def board_params
        params.require(:board).permit(:name, :title, :body)
    end
end
