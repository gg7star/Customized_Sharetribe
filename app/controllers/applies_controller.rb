class AppliesController < ApplicationController
  # GET /applies
    # GET /applies.json
    def index
      @applies = Apply.all
    end

    # GET /applies/1
    # GET /applies/1.json
    def show
      @apply = Apply.find(@_params[:id]);
    end

    # GET /applies/new
    def new
      @apply = Apply.new
      params = @_params[:apply]
      # @apply.transaction_id = params[:tranaction_id]
      # @apply.listing_id = params[:listing_id]
      # @apply.applier_id = params[:applier_id]
      @apply.given_name = params[:given_name]
      @apply.family_name = params[:family_name]
      @apply.email = params[:email]
      @apply.phone_number = params[:phone_number]
      @apply.house_number_or_name = params[:house_number_or_name]
      @apply.street = params[:street]
      @apply.area = params[:area]
      @apply.city = params[:city]
      @apply.postcode = params[:postcode]
      @apply.country = params[:country]
      @apply.age = params[:age]
      @apply.gender = params[:gender]
      @apply.medical_condition_description = params[:medical_condition_description]
      @apply.hear_about_description = params[:hear_about_description]
      @apply.best_call_day_description = params[:best_call_day_description]
      @apply.best_call_time_description = params[:best_call_time_description]
      @apply.convenient_time_descriptin = params[:convenient_time_descriptin]
      @apply.transaction_id = params[:tranaction_id]
      @apply.listing_id = params[:listing_id]
      @apply.applier_id = params[:applier_id]
    end

    # GET /applies/1/edit
    def edit
    end

    # POST /applies
    # POST /applies.json
    def create
      puts "\n\napplie_create_params = " % @_params
      params = @_params[:apply]
      @apply = Apply.new
      @apply.given_name = params[:given_name]
      @apply.family_name = params[:family_name]
      @apply.email = params[:email]
      @apply.phone_number = params[:phone_number]
      @apply.house_number_or_name = params[:house_number_or_name]
      @apply.street = params[:street]
      @apply.area = params[:area]
      @apply.city = params[:city]
      @apply.postcode = params[:postcode]
      @apply.country = params[:country]
      @apply.age = params[:age]
      @apply.gender = params[:gender]
      @apply.medical_condition_description = params[:medical_condition_description]
      @apply.hear_about_description = params[:hear_about_description]
      @apply.best_call_day_description = params[:best_call_day_description]
      @apply.best_call_time_description = params[:best_call_time_description]
      @apply.convenient_time_descriptin = params[:convenient_time_descriptin]
      @apply.transaction_id = params[:tranaction_id]
      @apply.listing_id = params[:listing_id]
      @apply.applier_id = params[:applier_id]

      respond_to do |format|
        if @apply.save
          format.html { redirect_to @apply, notice: 'Apply was successfully created.' }
          format.json { render :show, status: :created, location: @apply }
        else
          format.html { render :new }
          format.json { render json: @apply.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /applies/1
    # PATCH/PUT /applies/1.json
    def update
      respond_to do |format|
        if @apply.update(apply_params)
          format.html { redirect_to @apply, notice: 'Apply was successfully updated.' }
          format.json { render :show, status: :ok, location: @apply }
        else
          format.html { render :edit }
          format.json { render json: @apply.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /applies/1
    # DELETE /applies/1.json
    def destroy
      @apply.destroy
      respond_to do |format|
        format.html { redirect_to applies_url, notice: 'Apply was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

end
