class ArticlesController < ApplicationController
  
  before_action :authenticate_user!
  def index
    @article = Article.new
    @articles = Article.text_search(params[:query], params[:ad_type]).page(params[:page]).per_page(40)
    # flash[:notice] = "Widget was successfully created."

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.js   { render :layout => false }
      format.html { redirect_to article_url, notice: "Band was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  
  def show
    @articles = Article.find(params[:id])
    @comment = Comment.new(article_id: @articles.id)
    @contactmethod = params[:contactmethod]
    @ad_type = params[:ad_type]
    respond_to do |format|
      if @ad_type = "one"
        # flash[:notice] = "Widget was successfully created."
        format.json { render :show, status: :ok, location: @articles }
      else
        flash[:notice] = "Widget was successfully created."
        format.json { render json: @articles.errors, status: :unprocessable_entity }
      end
    end
  end
  def collection_radio_buttons(method, collection, value_method, text_method, options = {}, html_options = {}, &block)
  @template.collection_radio_buttons(@object_name, method, collection, value_method, text_method, objectify_options(options), @default_html_options.merge(html_options), &block)
end




end
