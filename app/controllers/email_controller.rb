class EmailController < ApplicationController
  def index
    @email= Email.all
  end

  def create
    @email = Email.create!(object: Faker::Book.title, body: Faker::Book.title, read: false)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def show
    @email = Email.find(params['id'])
    @email.update(read: true)
    respond_to do |format|
      format.html {redirect_to email_path(@email.id)}
      format.js { }
    end
  end

  def update
    @email = Email.find(params[:id])
    puts "$"*50
    puts @email
    puts params
    if @email.read
      @email.update!(read: false)
    else
      @email.update!(read: true)
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def destroy
    @email = Email.find(params['id'])
    @email.destroy
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js { }
    end
  end
end