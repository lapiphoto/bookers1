class BookController < ApplicationController
  def new
  	@book = Book.new
  end
end
def create
    # １. データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # ３. トップ画面へリダイレクト
    redirect_to book_path(book.id)
  end

  def index
  	@books = Book.all
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
  	book = Book.find(params[:id]) #データ(レコード)を1件取得
    book.destroy #データ（レコード）を削除
    redirect_to book_path #List一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end