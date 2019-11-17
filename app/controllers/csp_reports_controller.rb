class CspReportsController < ApplicationController
  skip_before_action(:verify_authenticity_token)

  def create
    report_base = JSON.parse(request.body.read)
    if report_base.key?("csp-report")
      report = report_base["csp-report"]
      CspReport.create(
        blocked_uri: report["blocked-uri"].try(:downcase),
        disposition: report["disposition"].try(:downcase),
        document_uri: report["document-uri"],
        effective_directive: report["effective-directive"].try(:downcase),
        violated_directive: report["violated-directive"].try(:downcase),
        referrer: report["referrer"].try(:downcase),
        status_code: (report["status-code"].presence || 0).to_i,
        raw_report: report,
        raw_browser: request.headers["User-Agent"]
      )
    end
    head(:ok)
  end
end
