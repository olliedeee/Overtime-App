class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy, :approve, :send_text, :send_email]
	
	
	
	def index
		@posts = Post.posts_by(current_user).page(params[:page]).per(10)
		# pre-kaminari this was: 		@posts = Post.posts_by current_user
	end
	
	def send_text
		authorize @post
		employee_number = @post.user.phone[1..-1]
		SmsTool.send_sms(number: employee_number, message: "Can I press a button and send a text? Yes I can.")
		redirect_to root_path, notice: "Text sent (maybe)"
	end
	
	def send_email
		authorize @post
		employee_email = @post.user.email
		SmsTool.send_sms(number: employee_number, message: "Can I press a button and send a text? Yes I can.")
		redirect_to root_path, notice: "Text sent (maybe)"
	end
	
	
	def approve
		authorize @post
		@post.approved!
		redirect_to root_path, notice: "Post has been approved!"
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id

		if @post.save
			redirect_to @post, notice: 'Your post was created successfully'
		else
			render :new
		end
	end

	def edit
		authorize @post
	end
	
	def update
		authorize @post
	if @post.update(post_params)
			redirect_to @post, notice: 'Your post was edited successfully'
		else
			render :edit
		end
	end
	
	def show
	end
	
	def destroy
		if @post.delete
			redirect_to posts_path, notice: 'Your post was deleted successfully'
		else
			redirect_to posts_path, notice: 'Your post was not deleted'
		end
	end

	private

	  def post_params
	  	params.require(:post).permit(:date, :work_performed, :status, :daily_hours)
	  end

	  def set_post
	  	@post = Post.find(params[:id])
	  end
end