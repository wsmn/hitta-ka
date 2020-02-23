# frozen_string_literal: true

module ApplicationHelper
  def nav_active?(actions)
    name = "#{controller_name}##{action_name}"
    actions.include?(name)
  end

  def sidebar_link(active, path, icon: nil, text: "", icon_class: "w-10 inline-block text-center", link_class: "px-2 py-3 flex items-center text-white hover:bg-gray-700")
    content = []
    if icon
      content << content_tag(:div, class: icon_class) do
        icon("fas", icon, class: "mt-1")
      end
    end
    content << content_tag(:span, text, class: "font-light")
    link_to(path, class: link_class) do
      if block_given?
        yield
      else
        content.join.html_safe
      end
    end
  end

  def header_active(target, base, extra)
    css = base
    if nav_active?(target)
      css += " #{extra}"
    end
    css
  end

  def header_links
    [
      {name: I18n.t("application.header.home"), url: root_url},
      {name: I18n.t("application.header.map"), url: map_url},
      {name: I18n.t("application.header.kontrollansvarig"), url: kontrollansvarig_url},
      {name: I18n.t("application.header.about"), url: about_url},
    ].to_json.html_safe
  end

  def account_links
    [
      {name: I18n.t("application.header.projects"), url: projects_url},
      {name: I18n.t("application.header.customers"), url: customers_url},
      {name: I18n.t("application.header.tasks"), url: tasks_url},
      {name: I18n.t("application.header.invoices"), url: invoices_url},
    ].to_json.html_safe
  end

  def account_link
    {
      name: I18n.t("application.header.account"), url: account_url,
    }.to_json.html_safe
  end

  def connect_link
    {
      name: I18n.t("application.header.connect_company"), url: connect_url,
    }.to_json.html_safe
  end

  def sign_in_link
    {
      name: I18n.t("application.header.sign_in"), url: sign_in_url,
    }.to_json.html_safe
  end

  def sign_out_link
    {
      name: I18n.t("application.header.sign_out"), url: sign_out_url,
    }.to_json.html_safe
  end
end
