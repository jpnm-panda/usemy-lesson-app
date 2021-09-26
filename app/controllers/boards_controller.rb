class BoardsController < ApplicationController
    def index
    end

    # new.html.erb で入力を行うために、Board Class からインスタンスを作成し、@board に代入にしている
    def new
        @board = Board.new
    end
end
