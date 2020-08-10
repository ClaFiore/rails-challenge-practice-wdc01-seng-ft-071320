class CompaniesController < ApplicationController

    before_action :find_company, only: [:show, :edit, :update, :destroy]

    def index
        @companies = Company.all
    end

    def show
        @employee = Employee.new
    end

    def new
        @company = Company.new
    end
    
    def create
        @company = Company.create(company_params)
        redirect_to company_path(@company)
    end

    def add_employee
        @employee = Employee.create(employee_params)
        redirect_to company_path(@employee.company_id)
    end

    def find_company
        @company = Company.find(params[:id])
    end

    def company_params
        params.require(:company).permit(:name, :building_ids => [])
    end

    def employee_params
        params.require(:employee).permit(:name, :title, :company_id)
    end
end