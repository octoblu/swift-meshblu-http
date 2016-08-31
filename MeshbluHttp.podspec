Pod::Spec.new do |s|
  s.name             = "MeshbluHttp"
  s.version          = "1.0.0"
  s.summary          = "Swift Meshblu HTTP Client Library"
  s.description      = <<-DESC
    Swift Meshblu HTTP Client Library, currently iOS only
DESC
  s.homepage         = "https://github.com/octoblu/swift-meshblu-http"
  s.license          = 'MIT'
  s.author           = { "Octoblu" => "cocoapods@octoblu.com" }
  s.source           = { :git => "https://github.com/octoblu/swift-meshblu-http.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/octoblu'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'MeshbluHttp/Classes/**/*'

  s.dependency 'Alamofire', '~> 3.4'
  s.dependency 'SwiftyJSON', '~> 2.3'
  s.dependency 'Result', '~> 2.1'
end
