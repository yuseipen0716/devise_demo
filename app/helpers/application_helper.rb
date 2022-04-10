module ApplicationHelper
  # archivenのkey(yyyymmdd)とvalue(count)を拾ってきて表示するためのヘルパー
  def show_archive(yyyymm, count)
    yyyy = yyyymm[0,4]
    mm = yyyymm[4,2]
    return yyyy + "年" + mm + "月(" + count + ")"
  end

  def show_yyyymm(yyyymm)
    yyyy = yyyymm[0,4]
    mm = yyyymm[4,2]
    return yyyy + "年" + mm + "月"
  end
end
