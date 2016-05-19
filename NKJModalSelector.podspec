Pod::Spec.new do |s|
  s.name             = "NKJModalSelector"
  s.version          = "0.2.2"
  s.summary          = "NKJModalSelector is the alternative to the library of UIPickerView(drum roll). Is inspired to Etsy's view controller transition."
  s.homepage         = "https://github.com/nakajijapan/NKJModalSelector"
  s.license          = 'MIT'
  s.author           = { "nakajijapan" => "pp.kupepo.gattyanmo@gmail.com" }
  s.source           = { :git => "https://github.com/nakajijapan/NKJModalSelector.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/nakajijapan'
  s.platform         = :ios, '8.0'
  s.requires_arc     = true
  s.source_files     = 'Sources/Classes/**/*'

end
