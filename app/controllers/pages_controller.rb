class PagesController < ApplicationController
  def about
  end

  def services
  end

  def portfolio
  end

  def career
  end

  def team
  end

  def technology
  end

  def blog
  end

  def contact
    @contact = Contact.new
  end
end
