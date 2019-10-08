# coding: utf-8
class PortfolioController < ApplicationController
  def index
    @portfolio_form = PortfolioForm.new
  end

  def show
    form = params.require(:portfolio_form).permit(:user_id, {tag_ids: []})
    @portfolio_form = PortfolioForm.new(form)
    @portfolio = @portfolio_form.search()

    # jumbotron を使っているので、application.html.erb のレイアウトを
    # 適用しないようにする。
    render layout: false
  end
end
