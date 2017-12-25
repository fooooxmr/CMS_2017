class PagesController < ApplicationController
  #new page
  def new
   @page = Page.new
  end

  #index page
  def index
   @published_pages = Page.where(published: true).order(:priority).find_all
   @not_published_pages = Page.where(published: false).find_all
  end

  #show page
  def show
    @page = Page.find_by_slug(params[:id])
  end

  #destroy action
  def destroy
   @page = Page.find_by_slug(params[:id])
    @page.destroy
    redirect_to pages_path
  end

  #edit page
  def edit
    @page = Page.find_by_slug(params[:id])
  end

  #create page
  def create
    @page = Page.new(post_params)
    if @page.save
      redirect_to @page
    else
      render 'new'
    end
  end

  #update action
  def update
    @page = Page.find_by_slug(params[:id])

    if @page.update(post_params)
      redirect_to @page
    else
      render 'edit'
    end
  end

  #post params function
  private
  def post_params
    params.require(:page).permit(:title,:description,:slug,:menu_label,:content,:h1,:priority,:published,:published_at) #I took a guess at the attributes you are passing through your params on the create.
  end

end
