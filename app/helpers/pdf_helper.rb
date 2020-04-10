# Based on https://stackoverflow.com/a/60541688/4762756
# This helper helps in development mode.
module PdfHelper
  def pdf_stylesheet_pack_tag(source)
    if running_in_development?
      options = {media: "all"}
      wds = Webpacker.dev_server
      options[:host] = "#{wds.host}:#{wds.port}"
      stylesheet_pack_tag(source, options)
    else
      wicked_pdf_stylesheet_pack_tag(source)
    end
  end

  def pdf_javascript_pack_tag(source)
    if running_in_development?
      options = {}
      wds = Webpacker.dev_server
      options[:host] = "#{wds.host}:#{wds.port}"
      javascript_pack_tag(source, options)
    else
      wicked_pdf_javascript_pack_tag(source)
    end
  end
end
