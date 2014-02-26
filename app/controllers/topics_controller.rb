class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @post = @topic.posts.build(params[:post])
  end

  # GET /topics/new
  def new
    @category = Category.find_by(id: params[:category_id])
    @topic = @category.topics.new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  # POST /topics.json
  def create
    @category = Category.find_by(id: params[:category_id])
    @topic = @category.topics.new(topic_params)

      if @topic.save
        flash[:success] = "temat został utworzony"
        redirect_to [@category, @topic]
      else
        flash[:error] = "coś poszło nie tak"
      end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    if @topic.update(topic_params)
      redirect_to category_topic_path(params[:category_id], @topic)
      flash['success'] = 'sukces'
    else
      redirect_to category_topic_path(params[:category_id], @topic)
      flash['error'] = 'coś poszło nie tak'
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:name, :heading, :user_id)
    end
    
end
