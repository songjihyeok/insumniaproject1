class PagesController < ApplicationController

  def index
    @post = Post.all
  end

  def blog
  end
end
