class PortfolioController < ApplicationController
  def index
    @portfolio_form = PortfolioForm.new
    init_conditions
  end

  def show
    form = params.require(:portfolio_form).permit(:user_id, {tech_tag_ids: {}}, :count)
    @portfolio_form = PortfolioForm.new(form)

    @user = User.find_by(id: params[:portfolio_form][:user_id]) if @portfolio_form.valid?
    init_conditions
    unless @user&.published
      # 非公開ユーザが指定された場合は元画面に戻す。
      flash.now[:danger] = I18n.t 'invalid_process'
      render action: :index
      return
    end

    @projects = @portfolio_form.search

    # jumbotron を使っているので、application.html.erb のレイアウトを
    # 適用しないようにする。
    #render layout: false
    @portfolio = {}
    @portfolio[:user] = @user
    @portfolio[:projects] = @projects
    render action: :index
  end

  private

  def init_conditions
    @tech_categories = TechCategory.includes(:tech_tags).order(:display_order)
    @counts = [[5, 5], [10, 10], [30, 30], ["全て", -1]]
  end
end
