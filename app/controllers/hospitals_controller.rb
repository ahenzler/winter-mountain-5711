class HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
    @doc_count = @hospital.doctor_count
    @universities = @hospital.university_list
  end
end