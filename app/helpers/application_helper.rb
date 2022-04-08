module ApplicationHelper
  # archivenのkey(yyyymmdd)とvalue(count)を拾ってきて表示するためのヘルパー
  def show_archive(yyyymm, count)
    year = yyyymm[0,4]
    month = yyyymm[4,2]
     "#{year}年#{month}月(#{count})"
  end

  def qiita_markdown(markdown)
    processor = Qiita::Markdown::Processor.new(hostname: "example.com")
    processor.call(markdown)[:output].to_s.html_safe
  end
end
