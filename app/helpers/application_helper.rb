module ApplicationHelper
  # archivenのkey(yyyymmdd)とvalue(count)を拾ってきて表示するためのヘルパー
  def show_archive(yyyymm, count)
    year = yyyymm[0,4]
    month = yyyymm[4,2]
     "#{year}年#{month}月(#{count})"
  end
end
