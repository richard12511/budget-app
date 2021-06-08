class DebitsController < ApplicationController
  before_action :set_debit, only: %i[ show edit update destroy ]
  before_action :is_same_user?, except: [:index, :new, :create]

  def index
    @debits = Debit.where(user_id: current_user.id)
  end

  def index_all
    @debits = Debit.all()
  end

  def show
  end

  def new
    @debit = Debit.new
  end

  def edit
  end

  def create
    @debit = Debit.new(debit_params)

    respond_to do |format|
      if @debit.save

        format.html { redirect_to debit_url(@debit), notice: "Debit was successfully created." }
        format.json { render :show, status: :created, location: @debit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @debit.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @debit.update(debit_params)
        format.html { redirect_to @debit, notice: "Debit was successfully updated." }
        format.json { render :show, status: :ok, location: @debit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @debit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @debit.destroy
    respond_to do |format|
      format.html { redirect_to debits_url, notice: "Debit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_debit
      @debit = Debit.find(params[:id])
      test = "test"
    end

    def is_same_user?
      @debit_user = @debit.user
      redirect_to(root_url) unless current_user?(@debit_user)
    end

    def is_admin?
      redirect_to(root_url) unless current_user.is_admin?
    end

    def debit_params
      params.require(:debit).permit(:frequency, :currency, :remarks, :amount, :user_id)
    end
end
