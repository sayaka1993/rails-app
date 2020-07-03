class ArticlesController < ApplicationController
 

 before_action:authenticate_user
 def index
    @articles = Article.all
 end

 # 記事の表示
 def show
    @article = Article.find(params[:id])
 end

 # 記事の作成
 def new 
    @article = Article.new
 end

 # 記事の登録
 def create
     # articleモデルの属性の初期化
     @article = Article.new(article_params)

     # DBに登録できた場合
     if @article.save
      flash[:notice] = "投稿を作成しました"
        # 記事ページに遷移する
        redirect_to articles_path
    # DBに登録できなかった場合
    else
        # 作成ページに遷移する
        render 'new'
    end
 end

 # 記事の編集
 def edit
    @article = Article.find(params[:id])
 end

 # 記事の更新
 def update
    @article = Article.find(params[:id])
   # DBに登録できた場合
   if @article.update(article_params)
    # 記事ページに遷移する
    redirect_to articles_path
# DBに登録できなかった場合
else
    # 編集ページに遷移する
    render 'edit'
end
 end

 # 記事の削除
 def destroy
    @article = Article.find(params[:id])

        # 記事の削除
        @article.destroy
       
        # TOPページに遷移する
        redirect_to articles_path
 end

  # showアクションにリダイレクト
 private
 def article_params
     params.require(:article).permit(:title, :text)
 end
end
