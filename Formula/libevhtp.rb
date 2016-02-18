class Libevhtp < Formula
  desc "A more flexible replacement for libevent's http API"
  homepage 'http://ellzey.github.io/libevhtp/'

  url 'https://github.com/ellzey/libevhtp/archive/1.2.10.tar.gz'
  version '1.2.10'
  sha1 'c481be3b26a4379e39d5952ff60a195f2c0e2176'
 
  head 'https://github.com/ellzey/libevhtp.git'
 
  depends_on 'cmake' => :build
  depends_on 'libevent'
  
  depends_on 'openssl' => :recommended
  depends_on 'oniguruma' => :recommended
  depends_on 'jemalloc' => :optional
  
  option "without-oniguruma", "Disable regex support"
  option "without-evthr", "Disable evthread support"
  option "with-shared", "Build shared library too"
 
  def install
    args = ["."]
    
    args << "-DEVHTP_DISABLE_SSL:STRING=ON" if build.without? "openssl"
    args << "-DEVHTP_DISABLE_REGEX:STRING=ON" if build.without? "oniguruma"
    args << "-DEVHTP_DISABLE_EVTHR:STRING=ON" if build.without? "evthr"
    
    args << "-DEVHTP_BUILD_SHARED:STRING=ON" if build.with? "shared"
    args << "-DEVHTP_USE_JEMALLOC:STRING=ON" if build.with? "jemalloc"
    
    system "cmake", *args, *std_cmake_args
    system "make install"
  end
end
