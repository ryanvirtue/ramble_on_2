class TagsController < ApplicationController

  def create
    @tag =  Tag.new(tag_params)
    respond_to do |format|
      if @tag.save
        format.html { redirect_to dashboard_path }
        format.js
        # flash.now[:success] = 'Tag successfully created'
      else
        format.html { redirect_to dashboard_path, flash[:error] = "Couldn't create tag" }
        format.js
      end
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
  
end
