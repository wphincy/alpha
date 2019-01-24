module Gallery
  class PostsController < GalleryController


    # GET /posts
    # GET /posts.json
    def index
      if params[:tag].present?

      @posts = Post.with_attached_images.published.most_recent.tagged_with(params[:tag]).paginate(:page => params[:page], per_page: 5)

    else
      @posts = Post.with_attached_images.published.most_recent.paginate(:page => params[:page], per_page: 5)

  end
  end

    # GET /posts/1
    # GET /posts/1.json
    def show
      @post = Post.published.friendly.find(params[:id])
    end


  end
end
