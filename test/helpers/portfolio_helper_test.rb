class PortfolioHelperTest < ActionView::TestCase
  test "Return Unicode numeric character references" do
    str = "mailto:"

    assert_equal "&#x6d;&#x61;&#x69;&#x6c;&#x74;&#x6f;&#x3a;",
                  numerical_character_references(str)
  end

  test "数値文字参照で隠蔽されたmailtoリンクを返す。" do
    user = User.new
    user.email = "sting@nifty.com"

    assert_equal "<a href=\"&#x6d;&#x61;&#x69;&#x6c;&#x74;&#x6f;&#x3a;&#x73;&#x74;&#x69;&#x6e;&#x67;&#x40;&#x6e;&#x69;&#x66;&#x74;&#x79;&#x2e;&#x63;&#x6f;&#x6d;\">&#x73;&#x74;&#x69;&#x6e;&#x67;&#x40;&#x6e;&#x69;&#x66;&#x74;&#x79;&#x2e;&#x63;&#x6f;&#x6d;</a>",
                  mailto_link(user)
  end
 
  test "プロジェクトの期間文字列を返す。" do
    project = Project.new
    project.from = DateTime.new(2019, 2, 1, 12, 30, 45)
    project.to = DateTime.new(2019, 4, 10, 12, 30, 45)

    assert_equal "2019年2月 〜 2019年4月",
                 project_period(project)
  end

  test "開始のみのプロジェクト期間文字列を返す。" do
    project = Project.new
    project.from = DateTime.new(2019, 2, 1, 12, 30, 45)

    assert_equal "2019年2月 〜 ",
                 project_period(project)
  end

  test "終了のみのプロジェクト期間文字列を返す。" do
    project = Project.new
    project.to = DateTime.new(2019, 4, 10, 12, 30, 45)

    assert_equal " 〜 2019年4月",
                 project_period(project)
  end

  test "引数がnilの場合、空文字列を返す。" do
    assert_equal "",
                 project_period(nil)
  end
end
