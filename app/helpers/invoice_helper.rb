# frozen_string_literal: true

# View helper for projects
module InvoiceHelper
  def invoice_statuses
    Invoice.statuses.keys.map { |k| [invoice_status(k), k] }
  end

  def invoice_status(key)
    t("model.invoice.status.#{key}")
  end

  def invoice_tag(status)
    status_class = "text-sm md:text-base inline-flex font-semibold rounded-full h-6 px-3 md:px-4 justify-center items-center"
    status_class += " #{invoice_status_class(status)}"
    content_tag(:span, invoice_status(status), class: status_class)
  end

  def invoice_status_class(status)
    case status
    when "unpaid"
      "bg-yellow-200 text-yellow-800"
    when "paid"
      "bg-green-200 text-green-800"
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
