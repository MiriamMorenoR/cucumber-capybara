# frozen_string_literal: true

Dir[File.join(File.dirname(__FILE__), '../support/pages/home_page.rb')].sort.each { |file| require file }

# Modulo responsavel por instanciar as classes Pages Objects
module PageObjects
  def home_page
    @home_page ||= HomePage.new
  end
end
