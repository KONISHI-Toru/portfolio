# coding: utf-8
module PortfolioHelper
  # 文字列を数値文字参照に変換する。
  def numerical_character_references(str)
    if str.nil?
      return ""
    end

    str.bytes.map{|v| "&\#x#{v.to_s(16)};"}.join
  end

  # Unicode数値参照で偽装したmailtoリンクを生成する。
  def mailto_link(user)
    if user.nil?
      return ""
    end

    mailto = numerical_character_references("mailto:")
    converted = numerical_character_references(user.email)
    raw "<a href=\"#{mailto}#{converted}\">#{converted}</a>"
  end

  # プロジェクトの期間を表示するためのヘルパー。
  def project_period(project)
    if project.nil?
      return ""
    end

    from = ""
    if project.from.present?
      from = project.from.strftime('%Y年%-m月')
    end
    to = ""
    if project.to.present?
      to = project.to.strftime('%Y年%-m月')
    end

    if from == "" && to == ""
      return ""
    end

    "#{from} 〜 #{to}"
  end
end
