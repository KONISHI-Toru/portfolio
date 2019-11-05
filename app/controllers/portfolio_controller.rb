class PortfolioController < ApplicationController
  def index
    @portfolio_form = PortfolioForm.new
    @tech_categories = TechCategory.order(:display_order)
  end

  def show
    @user = User.find(params[:portfolio_form][:user_id])
    if ! @user.published
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
    @tech_categories = TechCategory.order(:display_order)
    render action: :index
  end
end
