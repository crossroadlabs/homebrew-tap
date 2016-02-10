class SwiftExpress < Formula
  desc "Command line project manager for Swift Express"
  homepage "http://swiftexpress.io/"
  version "0.1.2"
  url "https://github.com/crossroadlabs/ExpressCommandLine.git", :branch => "master"
  
  head "https://github.com/crossroadlabs/ExpressCommandLine.git", :branch => "master"

  depends_on :xcode => "7.2"
  depends_on :macos => :yosemite

  depends_on 'openssl'
  depends_on 'libevhtp'
  depends_on 'carthage' 

  def install
    system "carthage", "bootstrap", "--platform", "Mac"
    xcodebuild "SYMROOT=build"
    libexec.install "build/Release/swift-express.app"
    bin.install_symlink libexec/"swift-express.app/Contents/MacOS/swift-express"
  end
end
