# frozen_string_literal: true

Rails.application.routes.draw do
  get("404", controller: :errors, action: :not_found)
  get("422", controller: :errors, action: :unacceptable)
  get("500", controller: :errors, action: :internal_error)
  post("csp-violation-report", controller: :csp_reports, action: :create)

  resources(:passwords, controller: :passwords, only: %i[create new])
  resource(:session, controller: :sessions, only: %i[create])
  resources(:users, controller: "clearance/users", only: %i[create]) do
    resource(:password, controller: "clearance/passwords",
                        only: %i[create edit update])
  end

  get(:sign_in, controller: :sessions, action: :new, path: "sign-in")
  delete(:sign_out, controller: :sessions, action: :destroy,
                    path: "sign-out")
  get(:sign_up, controller: "clearance/users", action: :new, path: "sign-up")

  get(:account, controller: :presentation, action: :account)
  get(:settings, controller: :presentation, action: :settings)

  resources(:customers, controller: :customers)

  get(:projects, controller: :presentation, action: :projects)
  get(:project, controller: :presentation, action: :project)
  get(:new_project, controller: :presentation, action: :new_project)

  get(:tasks, controller: :presentation, action: :tasks)
  get(:task, controller: :presentation, action: :task)

  get(:invoices, controller: :presentation, action: :invoices)
  get(:invoice, controller: :presentation, action: :invoice)
  get(:new_invoice, controller: :presentation, action: :new_invoice)

  resource(:search, only: []) do
    post(:company)
    post(:project)
    post(:customer)
  end

  get(:map, controller: :map, action: :index)

  get(:about, controller: :presentation, action: :about)
  get(:contact, controller: :presentation, action: :contact)
  get(:support_error, controller: :presentation, action: :support_error, path: "support-error")
  get(:support_general, controller: :presentation, action: :support_general, path: "support-general")
  get(:support_improvement, controller: :presentation, action: :support_improvement, path: "support-improvement")
  get(:kontrollansvarig, controller: :presentation, action: :kontrollansvarig)
  get(:connect, controller: :presentation, action: :connect)
  get(:home2, controller: :presentation, action: :home2)
  get(:form, controller: :presentation, action: :form)

  root(controller: :presentation, action: :index)
end
