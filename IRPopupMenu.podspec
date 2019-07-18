Pod::Spec.new do |spec|
  spec.name         = "IRPopupMenu"
  spec.version      = "1.0.0"
  spec.summary      = "Custom popup menu."
  spec.description  = <<-DESC
                   DESC
  spec.homepage     = "https://github.com/irons163/IRPopupMenu.git"
  spec.license      = "MIT"
  spec.author             = "irons163"
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/irons163/IRPopupMenu.git", :tag => "#{spec.version}" }
# spec.source       = { :path => '.' }
  spec.source_files  = "IRPopupMenu"
end
