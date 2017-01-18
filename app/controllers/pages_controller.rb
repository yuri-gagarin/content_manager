class PagesController < ApplicationController
  def index

    @pages = Page.all

  end

  def show

    @page = Page.find(params[:id])

  end

  def new

    @page = Page.new(:name => 'Name Here', :permalink => 'Permalink')

  end

  def create

    @page = Page.new(page_params)

    if @page.save

      flash[:notice] = 'The page was saved!'
      redirect_to(page_path(@page))

    else

      flash[:notice] = 'Error in saving the page. Please try again'
      render(:new)

    end

  end

  def edit

    @page = Page.find(params[:id])

  end

  def update

    @page = Page.find(params[:id])

    if @page.update_attributes(page_params)

      flash[:notice] = 'The page was updated successfully!'
      redirect_to(page_path(@page))

    else

      flash[:notice] = 'There was an error. Please try again!'
      render(:edit)

    end
  end

  def delete

    @page = Page.find(params[:id])

  end

  def destroy

    @page = Page.find(params[:id])

    if @page.destroy

      flash[:notice] = "The page '#{@page.name}' was destroyed successfully!"
      redirect_to(pages_path)

    else

      flash[:notice] = "Error in deleting '#{@page.name}', please try again!"
      render(:delete)

    end

  end

  private

    def page_params

      params.require(:page).permit(:name, :permalink, :position, :visible)

    end
end
