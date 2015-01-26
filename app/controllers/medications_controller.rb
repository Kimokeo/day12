class MedicationsController < ApplicationController
	def index
		@hospital = Hospital.find params[:hospital_id]
		@patient = Patient.find params[:patient_id]
		@medications = Medication.all
	end

	def show
		@hospital = Hospital.find params[:hospital_id]
		@patient = Patient.find params[:patient_id]
		@medications = @patient.medications


	def new
		@hospital = Hospital.find params[:hospital_id]
		@patient = Patient.find params[:patient_id]
		@medications = @patient.medications.new
	end

	def create
		@hospital = Hospital.find params[:hospital_id]
		@patient = Patient.find params[:patient_id]
		@medications = @patient.medications.create med_params
		redirect_to hospital_patient_path(@hospital, @patient)
	end

	def edit
		@hospital = Hospital.find params[:hospital_id]
		@patient = Patient.find params[:patient_id]
	end

	def update
		@hospital = Hospital.find params[:hospital_id]
		@patient = Patient.find params[:patient_id]
		@medication.update_attributes med_params
		redirect_to hospital_patient_med_path
	end

	def destroy
		@hospital = Hospital.find params[:hospital_id]
		@patient = Patient.find params[:patient_id]
		@medication.destroy
		redirect_to hospital_patient_med_path
	end
private
	def med_params
		params.require(:medication).permit(
			:name,
			:dose,
			)
	end
end
end