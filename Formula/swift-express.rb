class SwiftExpress < Formula
  desc "Command line project manager for Swift Express"
  homepage "http://swiftexpress.io/"
  version "0.3.0"
  url "https://github.com/crossroadlabs/ExpressCommandLine.git", :tag => version
  
  head "https://github.com/crossroadlabs/ExpressCommandLine.git", :branch => "master"

  depends_on :xcode => "8.3"
  depends_on :macos => :el_capitan

  depends_on 'libevhtp' => ["without-oniguruma", "with-shared", "without-openssl"]

  def install
    system "swift", "build", "-c", "release"
    bin.install ".build/release/swift-express"
  end
end
