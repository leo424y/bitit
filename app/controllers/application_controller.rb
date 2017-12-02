class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # SEO
  before_action :prepare_meta_tags, if: "request.get?"


  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def set_locale
    # 可以將 ["en", "zh-TW"] 設定為 VALID_LANG 放到 config/environment.rb 中
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end

    I18n.locale = session[:locale] || I18n.default_locale
  end


  protect_from_forgery with: :exception



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end


  #SEO
  def prepare_meta_tags(options={})
      site_name   = "cTaiwan"
      title       = "字造者"
      description = "拼一個自己的字! 讓我們造字，不造次。在日子裡找屬於你的字，用它談談你的故事。"
      image       = options[:image] || "https://tools.wmflabs.org/idsgen/%E2%BF%B1%E2%BF%B1%E8%87%BC%E5%A4%A7%E5%BF%83.png?%E5%AD%97%E9%AB%94=%E5%AE%8B%E9%AB%94"
      current_url = request.url
      defaults = {
        site:        site_name,
        title:       title,
        image:       image,
        description: description,
        canonical:   current_url,
        keywords:    %w[中文 國文 造字 合字 合文 倉頡 金萱 字型 字體 台灣 新年 春聯 無蝦米 招財進寶 合字文間 justfont],
        og:          {url: current_url,
                      site_name: site_name,
                      title: title,
                      image: image,
                      description: description,
                      type: 'website'}
      }
  end
end
