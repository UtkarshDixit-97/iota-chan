class DiscussionThreadsController < ApplicationController
  before_action :set_discussion_thread, only: %i[ show edit update destroy ]

  # GET /discussion_threads or /discussion_threads.json
  def index
    @discussion_threads = DiscussionThread.all
  end

  # GET /discussion_threads/1 or /discussion_threads/1.json
  def show


  end

  # GET /discussion_threads/new
  def new

    @discussion_thread = DiscussionThread.new(board_id: params['board_id'])
  end

  # GET /discussion_threads/1/edit
  def edit
  end

  # POST /discussion_threads or /discussion_threads.json
  def create
    @discussion_thread = DiscussionThread.new(discussion_thread_params)

    respond_to do |format|
      if @discussion_thread.save
        format.html { redirect_to @discussion_thread, notice: "Discussion thread was successfully created." }
        format.json { render :show, status: :created, location: @discussion_thread }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @discussion_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discussion_threads/1 or /discussion_threads/1.json
  def update
    respond_to do |format|
      if @discussion_thread.update(discussion_thread_params)
        format.html { redirect_to @discussion_thread, notice: "Discussion thread was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @discussion_thread }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @discussion_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussion_threads/1 or /discussion_threads/1.json
  def destroy
    @discussion_thread.destroy!

    respond_to do |format|
      format.html { redirect_to discussion_threads_path, notice: "Discussion thread was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion_thread
      @discussion_thread = DiscussionThread.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def discussion_thread_params
      params.expect(discussion_thread: [ :title, :content, :board_id, media: [] ])
    end
end
