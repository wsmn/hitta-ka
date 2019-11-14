# frozen_string_literal: true

module ApplicationHelper
  def nav_active?(controllers)
    controllers.include?(controller_name)
  end

  def aside_item_class(controllers)
    "is-active" if nav_active?(controllers)
  end

  def navbar_is_active(css, controllers)
    css += " is-active" if nav_active?(controllers)
    css
  end

  def header_links
    return [
      { name: I18n.t('application.header.home'), url: root_url },
      { name: I18n.t('application.header.map'), url: map_url },
      { name: I18n.t('application.header.kontrollansvarig'), url: kontrollansvarig_url },
      { name: I18n.t('application.header.about'), url: about_url },
    ].to_json.html_safe
  end

  def account_link
    return {
      name: I18n.t('application.header.account'), url: account_url
    }.to_json.html_safe
  end

  def connect_link
    return {
      name: I18n.t('application.header.connect_company'), url: connect_url
    }.to_json.html_safe
  end

  def sign_in_link
    return {
      name: I18n.t('application.header.sign_in'), url: sign_in_url
    }.to_json.html_safe
  end

  def sign_out_link
    return {
      name: I18n.t('application.header.sign_out'), url: sign_out_url
    }.to_json.html_safe
  end
end
