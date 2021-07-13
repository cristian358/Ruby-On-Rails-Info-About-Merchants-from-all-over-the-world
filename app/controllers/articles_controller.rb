class ArticlesController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_article, only: %i[ show edit update destroy ]
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
     @article = Article.find(params[:id])
    # # @comment = Comment.new(article_id: @articles.id)
    # @contactmethod = params[:contactmethod]
    # @ad_type = params[:ad_type]
    # respond_to do |format|
    #   if @ad_type = "one"
    #     # flash[:notice] = "Widget was successfully created."
    #     format.json { render :show, status: :ok, location: @articles }
    #   else
    #     flash[:notice] = "Widget was successfully created."
    #     format.json { render json: @articles.errors, status: :unprocessable_entity }
    #   end
    # end
  end
  # def collection_radio_buttons(method, collection, value_method, text_method, options = {}, html_options = {}, &block)
  # @template.collection_radio_buttons(@object_name, method, collection, value_method, text_method, objectify_options(options), @default_html_options.merge(html_options), &block)
# end
def edit
end
  # PATCH/PUT /friends/1 or /friends/1.json
def update
  respond_to do |format|
    if @article.update(article_params)
      format.html { redirect_to @article, notice: "Friend was successfully updated." }
      format.json { render :show, status: :ok, location: @article }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @article.errors, status: :unprocessable_entity }
    end
  end
end

private
# Use callbacks to share common setup or constraints between actions.
def set_article
  @article = Article.find(params[:id])
end

# Only allow a list of trusted parameters through.
def article_params
  params.require(:article).permit(:country, :name, :city, :street, :extra)
end

end
