# Based on https://stackoverflow.com/a/60541688/4762756
# This helper helps in development mode.
module PdfHelper
  def pdf_stylesheet_pack_tag(source)
    stylesheet_link_tag(asset_pack_url("#{source}.css"))
  end

  def pdf_javascript_pack_tag(source)
    if Rails.env.development?
      javascript_pack_tag(source)
    else
      wicked_pdf_javascript_pack_tag(source)
    end
  end

  def wicked_blob_path(file)
    if Rails.env.production?
      url_for(file)
    else
      ActiveStorage::Blob.service.send(:path_for, file.blob.key)
    end
  end
end
