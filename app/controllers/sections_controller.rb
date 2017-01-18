class SectionsController < ApplicationController
  def index

    @sections = Section.all

  end

  def show

    @section = Section.find(params[:id])

  end

  def new

    @section = Section.new(name: 'name', position: 'position', content_type: 'type', content: 'some content here')

  end

  def create
    @section = Section.new(section_params)

    if @section.save

      flash[:notice] = 'Section saved successfully'
      redirect_to(section_path(@section))

    else

      flash[:notice] = 'Error saving section'
      render(:new)

    end
  end

  def edit

    @section = Section.find(params[:id])

  end

  def update

    @section = Section.find(params[:id])

    if @section.update_attributes(section_params)

      flash[:notice] = 'Section updated successfully'
      redirect_to(section_path(@section))

    else

      flash[:notice] = 'Error in updating the section'
      render(:edit)

    end
  end

  def delete

    @section = Section.find(params[:id])

  end

  def destroy

    @section = Section.find(params[:id])

    if @section.destroy

      flash[:notice] = "Section '#{@section.name}' was destroyed successfully!"
      redirect_to(sections_path)

    else

      flash[:notice] = "Section was not deleted"
      render(:delete)
      
    end
  end

  private

  def section_params

    params.require(:section).permit(:name, :position, :visible, :content_type, :content)

  end
end
