Pod::Spec.new do |spec|
  spec.name         = "IRPopupMenu"
  spec.version      = "1.0.0"
  spec.summary      = "Custom popup menu."
  spec.description  = "Custom popup menu."
  spec.homepage     = "https://github.com/irons163/IRPopupMenu.git"
  spec.license      = "MIT"
  spec.author             = "irons163"
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/irons163/IRPopupMenu.git", :tag => spec.version.to_s }
# spec.source       = { :path => '.' }
  spec.exclude_files = "IRPopupMenu/*.plist" 
  spec.source_files  = "IRPopupMenu/Class", "IRPopupMenu/*"
end
