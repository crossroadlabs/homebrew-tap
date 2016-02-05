require "formula"

class SwiftExpress < Formula
  desc "Command line project manager for Swift Express"
  homepage "http://swiftexpress.io/"
  version "0.1"

  url "https://github.com/ypopovych/ExpressCommandLine.git", :branch => "master"

  head "https://github.com/crossroadlabs/ExpressCommandLine.git", :branch => "master"

  devel do
    url "https://github.com/crossroadlabs/ExpressCommandLine.git", :branch => "develop"
  end 

  depends_on :xcode
  depends_on :macos => :yosemite

  depends_on 'libevhtp'
  depends_on 'openssl'
  depends_on 'carthage' 

  def install
    system "carthage", "bootstrap", "--platform", "Mac"
    xcodebuild "SYMROOT=build"
    libexec.install "build/Release/swift-express.app"
    bin.install_symlink libexec/"swift-express.app/Contents/MacOS/swift-express"
  end
end
