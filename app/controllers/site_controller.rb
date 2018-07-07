class SiteController < ApplicationController
  def index
    @posts = Post.where(publish: true).where(feature: true).sort_by { |post| post.published_at  }.reverse
  end
end
