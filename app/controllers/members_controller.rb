class MembersController < ApplicationController
  before_action :login_required

  def index
    @members = Member.order("number").page(params[:page]).per(15)
  end
  def show
    @member = Member.find(params[:id])
  end
  def new
    @member = Member.new(birthday: Date.new(1980,1,1))
  end
  def create
    @member = Member.new(params[:member])
    if @member.save
      flash[:notice] = "会員を登録しました"
      redirect_to member_path(@member)
    else
      render "new"
    end
  end
  def edit
    @member = Member.find(params[:id])
  end
  def update
    @member = Member.find(params[:id])
    @member.update(params[:member])
    if @member.save
      flash[:notice] = "会員情報を更新しました"
      redirect_to member_path(@member)
    else
      render "edit"
    end
  end
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    flash[:notice] = "会員情報を削除しました"
    redirect_to members_path
  end
  def search
    @members = Member.search(params[:q]).page(params[:page]).per(15)
    render "index"
  end
end
