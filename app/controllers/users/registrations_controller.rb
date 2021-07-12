# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_sign_up_params, if: :devise_controller?
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new
super
   end

  # POST /resource
  def create



    super do |created_user|
      if created_user.id
        # company = User.create! create_company_params
        created_user.update! role_id: 1
      end
    end


#     build_resource(sign_up_params)


#     # user = User.find params[:id]
#     # user.update_attributes user_params

#     resource.save
#     puts "oooooooooooooooooooopppppppppppppppppppppppppppppppppp"
# puts resource.to_json
# resource.role_id = 10
# resource.save
# puts "oooooooooooooooooooopppppppppppppppppppppppppppppppppp22222222222222222222222222222222"
# puts resource.to_json
#     yield resource if block_given?
#     if resource.persisted?
#       if resource.active_for_authentication?
#         set_flash_message! :notice, :signed_up
#         sign_up(resource_name, resource)
#         respond_with resource, location: after_sign_up_path_for(resource)
#       else
#         set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
#         expire_data_after_sign_in!
#         respond_with resource, location: after_inactive_sign_up_path_for(resource)
#       end
#     else
#       clean_up_passwords resource
#       set_minimum_password_length
#       respond_with resource
#     end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
      devise_parameter_sanitizer.permit(:sign_up) do |u|
        u.permit(:email, :password, :password_confirmation, :role_id,  role_attributes: [:name])
      end
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id])
    # params.require(:user).permit(:email, :password, :password_confirmation,
    #   role_attributes: [:name])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end










