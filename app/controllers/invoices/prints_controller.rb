class Invoices::PrintsController < ApplicationController
  include ActionController::Live
  def create
    invoice = Invoice.includes(:customer).find(params[:invoice_id])
    html = render_to_string(action: "_print.html.erb", layout: "pdf", locals: {invoice: invoice})
    pdf = Grover.new(html).to_pdf
    invoice.pdf.attach(io: StringIO.new(pdf), filename: invoice.filename, content_type: "application/pdf")
    respond_to do |format|
      format.html do
        if invoice.pdf.attached?
          redirect_to(invoice_prints_path(invoice))
        else
          redirect_to(customer_invoice_path(invoice.customer, invoice), error: t(".failed"))
        end
      end
      format.json do
        if invoice.pdf.attached?
          render(json: {}, status: :created)
        else
          render(json: {}, status: :unprocessable_entity)
        end
      end
    end
  end

  def show
    invoice = Invoice.includes(:customer).find(params[:invoice_id])
    if invoice.pdf.attached?
      download_and_stream(invoice.pdf)
    else
      redirect_to(customer_invoice_path(invoice.customer, invoice), error: t(".failed"))
    end
  end

  private

  def download_and_stream(file)
    response.headers["Content-Type"] = file.content_type
    response.headers["attachment; #{file.filename}"]
    file.download do |chunk|
      response.stream.write(chunk)
    end
  ensure
    response.stream.close
  end
end
