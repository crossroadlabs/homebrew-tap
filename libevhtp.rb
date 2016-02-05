class Libevhtp < Formula
  homepage 'http://ellzey.github.io/libevhtp/'
  url 'https://github.com/ellzey/libevhtp/archive/1.2.10.tar.gz'
  version '1.2.10'
  sha1 'c481be3b26a4379e39d5952ff60a195f2c0e2176'
 
  head 'https://github.com/ellzey/libevhtp.git'
 
  depends_on 'cmake' => :build
  depends_on 'openssl'
  depends_on 'libevent'
 
  def install
    system "cmake", ".", "-DEVHTP_DISABLE_REGEX:STRING=ON", *std_cmake_args
    system "make install"
  end
end
