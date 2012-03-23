# encoding: utf-8
class BookmarksController < ApplicationController
	before_filter :require_login

  def index
    @bookmarks = current_user.bookmarks
  end

  def show
    @bookmark = current_user.bookmarks.find(params[:id])
  end

  def edit
    @bookmark = current_user.bookmarks.find(params[:id])
  end

  def new
    @bookmark = current_user.bookmarks.build
  end

  def create
    @bookmark = current_user.bookmarks.build(params[:bookmark])
    if @bookmark.save
      redirect_to bookmarks_path, notice: "Favorit wurde erfolgreich angelegt."
    else
      render "new"
    end
  end

  def update
    @bookmark = current_user.bookmarks.find(params[:id])
    if @bookmark.update_attributes(params[:bookmark])
      redirect_to bookmarks_path, notice: "Favorit wurde erfolgreich geändert."
    else
      render "edit"
    end
  end

  def destroy
    @bookmark = current_user.bookmarks.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_url, notice: "Favorit wurde erfolgreich gelöscht."
  end

  private

  def require_login
    unless user_signed_in?
      redirect_to login_path,
        alert: "Bitte melden Sie sich zuerst an."
    end
  end
end
