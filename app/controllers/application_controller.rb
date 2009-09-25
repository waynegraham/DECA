# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  private 
  def cache(key)
    begin
      unless output = CACHE.get(key)
        output = yield
        CACHE.set(key, output)
      end
      return output
    rescue MemCache::MemCacheError
      yield
    end
  end
end
