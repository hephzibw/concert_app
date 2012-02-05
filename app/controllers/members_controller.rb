class MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def edit
    @member = Member.find params[:id]
  end

  def update
    @member = Member.find params.delete("id")
     if @member.update_attributes(params[:member])
      flash[:success] = "Profile Updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def create
    @member=Member.new(params[:member])
    if @member.save
      flash[:success] = "Member successfully added"
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    Member.find(params[:id]).delete
    redirect_to root_path
  end
end
