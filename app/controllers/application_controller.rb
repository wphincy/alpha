class ApplicationController < ActionController::Base

  layout :for_devise

  def for_devise
    'author'
  end
end
