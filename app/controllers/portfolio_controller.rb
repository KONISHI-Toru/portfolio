class PortfolioController < ApplicationController
  def index
    @portfolio_form = PortfolioForm.new
    init_conditions
  end

  def show
    @user = User.find(params[:portfolio_form][:user_id])
    init_conditions
    unless @user.published
      @tech_categories = TechCategory.order(:display_order)
      # 非公開ユーザが指定された場合は元画面に戻す。
      render action: :index
      return
    end

    form = params.require(:portfolio_form).permit(:user_id, {tech_tag_ids: []})
    @portfolio_form = PortfolioForm.new(form)
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
  end
end
