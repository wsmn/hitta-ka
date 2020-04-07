# frozen_string_literal: true

# View helper for projects
module InvoiceHelper
  def invoice_amount(amount)
    label = content_tag(:span, t("model.invoice.total"))
    amount = content_tag(:span, number_to_currency(amount), class: "text-green-500 text-lg ml-1")
    content_tag(:span, class: "text-gray-800 font-medium") do
      label.concat(amount)
    end
  end

  def invoice_statuses
    Invoice.statuses.keys.map { |k| [invoice_status(k), k] }
  end

  def invoice_status(key)
    t("model.invoice.status.#{key}")
  end

  def invoice_tag(status)
    status_class = "inline-flex items-center px-3 py-0.5 rounded text-sm font-medium leading-4 border"
    status_class += " #{invoice_status_class(status)}"
    content_tag(:span, invoice_status(status), class: status_class)
  end

  def invoice_status_class(status)
    case status
    when "unpaid"
      "bg-yellow-100 text-yellow-800 border-yellow-800"
    when "paid"
      "bg-green-100 text-green-800 border-green-800"
    end
  end

  def invoice_tag_mobile(status)
    status_class = "rounded-full h-3 w-3"
    status_class += " #{invoice_status_mobile_class(status)}"
    content_tag(:span, nil, class: status_class)
  end

  def invoice_status_mobile_class(status)
    case status
    when "unpaid"
      "bg-yellow-300"
    when "paid"
      "bg-green-400"
    end
  end

  def invoice_status_button(status, current, object: :invoices)
    current ||= :all
    object ||= :invoices
    css = "w-20 h-16 px-3 mr-2 -mb-px flex justify-center items-center"
    css = if status == current.to_sym
      "#{css} border-b-2 border-orange-600 text-orange-600 font-medium"
    else
      "#{css} text-gray-800 hover:text-orange-500"
    end
    if status == :all
      path = polymorphic_path(object)
      text = t("model.invoice.status.all")
    else
      path = polymorphic_path(object, status: status)
      text = invoice_status(status)
    end

    link_to(text, path, class: css)
  end
end
