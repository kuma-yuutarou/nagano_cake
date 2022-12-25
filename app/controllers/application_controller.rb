class ApplicationController < ActionController::Base
  def after_sign_up_path_for(resource)
   case resource
   when Admin
     admin_homes_top_path
   when Customer
     public_homes_top_path
   end
  end

 def after_sign_out_path_for(resource)
    case resource
    when :admin   # ログアウト時はシンボルが返ってくる
      new_admin_session_path
    when :customer  # ログアウト時はシンボルが返ってくる
      public_homes_top_path
    end
 end

end
