Grover.configure do |config|
  config.options = {
    format: 'A4',
    margin: {
      top: '25',
      bottom: '15',
      right: '25',
      left: '25'
    },
    prefer_css_page_size: true,
    emulate_media: 'screen',
    print_background: true,
    cache: false,
    timeout: 0, # Timeout in ms. A value of `0` means 'no timeout'
    wait_until: 'domcontentloaded'
  }
end
