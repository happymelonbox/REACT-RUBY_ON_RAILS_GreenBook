class Api::V1::HepatitisBVaccinesController < Api::V1::BaseController
    before_action :authentication_redirect, :only => [:index, :show]
    before_action :current_user
    before_action :set_hepatitis_b_vaccine, :only => [:show, :edit, :update, :destroy]

    def index
        @hepatitis_b_vaccines = HepatitisBVaccine.all
        if @hepatitis_b_vaccines
            render json: @hepatitis_b_vaccines.to_json(include: {
                child: {}
            })
        else
            render json:{
                status: 500,
                errors: ['no hepatitis_b_vaccines found']
            }
        end
    end

    def create
        @hepatitis_b_vaccine = HepatitisBVaccine.new(hepatitis_b_vaccine_params)
        @hepatitis_b_vaccine.save
        if @hepatitis_b_vaccine.save
            render json: {
                status: :created,
            }
        else
            render json: {
                status: 500,
                errors: @user.errors.full_messages
            }
        end
    end

    def update
        
        if @hepatitis_b_vaccine.update!(hepatitis_b_vaccine_params)
            render json: {
                status: :updated
            }
        else
            render json: {
                status: 500,
                errors: @user.errors.full_messages
            }
        end
    end

    def destroy
        @hepatitis_b_vaccine.destroy
    end

  private

    def set_hepatitis_b_vaccine
        @hepatitis_b_vaccine = HepatitisBVaccine.find(params[:id])
    end

    def hepatitis_b_vaccine_params
        params.require(:hepatitis_b_vaccine).permit(:place_given, :date, :batch_no, :given_by, :child_id, :id)
    end

  end