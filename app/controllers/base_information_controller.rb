class BaseInformationController < ApplicationController
  layout false
  def notice
    #选出公告中的最后10条
    @notices = Notice.last 10
  end

  def relation
  end
end
