class KittensController < ApplicationController
  before_action :find_kitten, except: %i[ index new create ]

  def index
    @kittens = Kitten.all
  end

  def show
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @post.save
      redirect_to @kitten, notice: 'Kitten was successfully created.'
    else
      flash.now[:alert] = 'Kitten was not created.'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: 'Kitten was successfully updated.'
    else
      flash.now[:alert] = 'Kitten was not updated.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten.destroy
    redirect_to kittens_path, notice: 'Kitten was successfully destroyed.'
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
