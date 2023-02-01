class PeopleController < ApplicationController
  def index
    @q = Person.ransack(params[:q])
    @people = @q.result(distinct: true).includes(:locations, :affiliations).paginate(page: params[:page], per_page: 10)
  end

  def upload_directory_data
    csv_processor = GalacticDirectoryCreator.new(params['galactic_data_file'].tempfile)
    if csv_processor.run && csv_processor.errors.empty?
      redirect_to people_path, notice: 'Galactic data processed successfully.'
    else
      redirect_to people_path
      flash[:alert] = csv_processor.errors.join(' <br> ')
    end
  end
end
