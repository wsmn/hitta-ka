# frozen_string_literal: true

Rails.application.routes.draw do
  get("404", controller: :errors, action: :not_found)
  get("422", controller: :errors, action: :unacceptable)
  get("500", controller: :errors, action: :internal_error)
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
  get(:projects, controller: :presentation, action: :projects)
  get(:project, controller: :presentation, action: :project)

  resource(:search, only: []) do
    post(:project)
    post(:customer)
  end

  get(:about, controller: :presentation, action: :about)
  get(:contact, controller: :presentation, action: :contact)
  get(:support_error, controller: :presentation, action: :support_error, path: "support-error")
  get(:support_general, controller: :presentation, action: :support_general, path: "support-general")
  get(:support_improvement, controller: :presentation, action: :support_improvement, path: "support-improvement")
  get(:kontrollansvarig, controller: :presentation, action: :kontrollansvarig)
  get(:map, controller: :presentation, action: :map)
  get(:connect, controller: :presentation, action: :connect)
  get(:home2, controller: :presentation, action: :home2)
  get(:form, controller: :presentation, action: :form)
  root(controller: :presentation, action: :index)
end
