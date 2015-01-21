class PatientsController < ApplicationController
	def new
		@patient = Patient.new
	end

	def create
		@patient = Patient.create que_params
	if @patient.save
    	flash[:notice] = 'Patient data was successfully created.'
    	redirect_to root_path
    else
    	flash[:error] = "Patient data was NOT saved."
    	render :new
	end
	end

	def edit
		@patient = Patient.find params[:id]
	end

	def update
		@patient = Patient.find params[:id]
		@patient.update_attributes que_params
	if @patient.save
    	flash[:notice] = 'Patient data was successfully created.'
    	redirect_to root_path
    else
    	flash[:error] = "Patient data was NOT saved."
    	render :new
    end
	end

	def show
		@patient = Patient.find params[:id]

	end

	def destroy
		@patient = Patient.find params[:id]
		@patient.delete
		redirect_to root_path
	end

private
	def que_params
		params.require(:patient).permit(
    	:first_name,
    	:last_name,
    	:dob,
    	:description,
    	:gender,
    	:blood_type,
)
	end
end
