class SubjectsController < ApplicationController

  def index

    @subjects = Subject.sorted

  end

  def show

    @subject = Subject.find(params[:id])

  end

  def new

    @subject = Subject.new({name: 'Name Here', position: 'Position Here'})

  end

  def create

    @subject = Subject.new(subject_params)

    if @subject.save
      #redirect to index if successful
      redirect_to(subjects_path)
      flash[:notice] = 'Subject created successfully'
    else
      render(:new)
      flash[:notice] = 'Error. Try again!'
    end

  end

  def edit

    @subject = Subject.find(params[:id])

  end

  def update

    @subject = Subject.find(params[:id])

    if @subject.update_attributes(subject_params)
      redirect_to(subject_path(@subject))
      flash[:notice] = 'Subject updated successfully'
    else
      render(:edit)
      flash[:notice] = 'Error. Try again!'
    end

  end

  def delete

    @subject = Subject.find(params[:id])

  end

  def destroy

    @subject = Subject.find(params[:id])

    if @subject.destroy
      redirect_to(subjects_path)
      flash[:notice] = "Subject '#{@subject.name}' destroyed!"
    else
      render(:delete)
    end

  end

  private

  def subject_params

    params.require(:subject).permit(:name, :position, :visible)

  end
end
