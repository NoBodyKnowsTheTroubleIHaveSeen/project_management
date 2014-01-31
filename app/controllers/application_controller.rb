class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #保存在cookie中的_csrf_token字段来生成自动添加在form中的隐藏字段_authenticity_token
  #来实现CSRF的功能。
  protect_from_forgery with: :null_session
  #在每个请求前的方法
  before_action :set_locale

  def set_locale
    #获取链接时选择的语言，加载国际化文件
    session[:locale] = params[:locale] if params[:locale]
    I18n.locale = session[:locale] || I18n.default_locale
    locale_path = "#{LOCALES_DIRECTORY}#{I18n.locale}.yml"
    unless I18n.load_path.include? locale_path
      I18n.load_path << locale_path
      I18n.backend.send(:init_translations)
    end
  rescue Exception => err
    logger.error err
    flash.now[:notice] = "#{I18n.locale} translation not available"
    I18n.load_path -= [locale_path]
    I18n.locale = session[:locale] = I18n.default_locale
  end
end
