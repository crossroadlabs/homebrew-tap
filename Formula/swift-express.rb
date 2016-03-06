class SwiftExpress < Formula
  desc "Command line project manager for Swift Express"
  homepage "http://swiftexpress.io/"
  version "0.2.1"
  url "https://github.com/crossroadlabs/ExpressCommandLine.git", :tag => version
  
  head "https://github.com/crossroadlabs/ExpressCommandLine.git", :branch => "master"

  depends_on :xcode => "7.2"
  depends_on :macos => :yosemite

  depends_on 'openssl'
  depends_on 'libevhtp' => ["without-oniguruma", "with-shared"]
  depends_on 'carthage' 

  def install
    system "carthage", "update", "--platform", "Mac"
    xcodebuild "SYMROOT=build"
    libexec.install "build/Release/swift-express.app"
    bin.install "swift-express/Scripts/swift-express"
  end
end
