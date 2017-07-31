class OrganisationsController < ApplicationController

  def index
    
  end

  def show
    
  end

  def new
    @organisation = Organisation.new
  end

  def create

    # Check that email is not taken
    unless Email.email_available?(params[:organisation][:email], @current_community.id)
      flash[:error] = t("people.new.email_is_in_use")
      redirect_to error_redirect_path and return
    end

    @organisation, email = new_organisation(params, @current_community)

  end

  def destroy
 
  end

  private

  # Create a new organisation by params and current community
  def new_organisation(params, current_community)
    
    params[:organisation][:locale] = params[:locale] || APP_CONFIG.default_locale
    params[:organisation][:test_group_number] = 1 + rand(4)
    params[:organisation][:community_id] = current_community.id
    organisation = Organisation.new(organisation_params)

    if organisation.save!
      flash[:success] = "Organisation was successfully created."
      redirect_to login_path
    else
      flash[:error] = organisation.errors
      render sign_up_organisation_path
    end

    email = nil

    [organisation, email]
  end

  private

  def organisation_params
    params.require(:organisation).permit(:org_name, :email, :org_phone_number, :org_type, :community_id, :locale, :test_group_number)
  end

end
