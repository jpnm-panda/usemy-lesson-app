class BoardsController < ApplicationController

    # index.html.erb で表示するために、Board Class からインスタンスを作成し、@boards に代入にしている
    def index
        @boards = Board.all
    end

    # new.html.erb で入力を行うために、Board Class からインスタンスを作成し、@board に代入にしている
    def new
        @board = Board.new
    end

    # Board Class のcreate method で引数(board_params) に渡された値を保存している
    def create
        Board.create(board_params)
    end

    # find method でリクエストされたid に対応する掲示板の値をparams[:id] で抽出し、@board に代入している
    def show
        @board = Board.find(params[:id])
    end

    # private method を使って設定したmethod はストロングパラメーターズとして、params の中の特定の値を格納できる
    private

    # 変数params の中のkey をrequire method で指定し、key の中で許可する値をpermit method で指定している
    def board_params
        params.require(:board).permit(:name, :title, :body)
    end
end
