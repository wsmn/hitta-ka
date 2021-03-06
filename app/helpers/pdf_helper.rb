# Based on https://stackoverflow.com/a/60541688/4762756
# This helper helps in development mode.
module PdfHelper
  def pdf_stylesheet_pack_tag(source)
    stylesheet_link_tag(asset_pack_url("#{source}.css"))
  end

  def pdf_javascript_pack_tag(source)
    javascript_pack_tag(source)
  end
end
