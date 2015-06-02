class FaqsController < ApplicationController
  def index
    @faqs = Faq.paginate(:page => params[:page])
    @title = 'All FAQs'
  end

  def show
    @faq = Faq.find(params[:id])
    @title = @faq.name
  end

  def create
    @faq = Faq.new(params[:faq])
    if @faq.save
      redirect_to @faq, :flash => { :success => 'FAQ created.'}
    else
      @title = 'New FAQ'
      render 'new'
    end
  end

  def edit
    @title = 'Edit FAQ'
  end

  def update
    if @faq.update_attributes(params[:faq])
      redirect_to @faq, :flash => { :success => 'FAQ updated.'}
    else
      @title = 'Edit FAQ'
      render 'edit'
    end
  end

  def destroy
    @faq.destroy
    redirect_to users_path, :flash => { :success => 'FAQ removed.'}
  end
end
