class MembersController < ApplicationController
  def index
    @members = Member.order("number")
  end
  def show
    @member = Member.find(params[:id])
  end
  def new
    @member = Member.new(birthday: Date.new(1980,1,1))
  end
  def create
  end
  def edit
  end
  def update
  end
  def destroy
  end
  def search
    @members = Member.search(params[:q])
    render "index"
  end
end
