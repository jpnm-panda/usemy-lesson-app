class BoardsController < ApplicationController
    def index
    end

    # new.html.erb で入力を行うために、Board Class からインスタンスを作成し、@board に代入にしている
    def new
        @board = Board.new
    end

    # 
    def create
        Board.create(board_params)
    end

    # private method を使って設定したmethod はストロングパラメーターズとして、params の中の特定の値を格納できる
    private

    # 変数params の中のkey をrequire method で指定し、key の中で許可する値をpermit method で指定している
    def board_params
        params.require(:board).permit(:name, :title, :body)
    end
end
