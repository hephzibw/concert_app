class MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
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
end
