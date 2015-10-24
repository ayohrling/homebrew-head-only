class Certstrap < Formula
  desc "Simple certificate manager written in Go."
  homepage "https://github.com/square/certstrap"
  head "https://github.com/square/certstrap.git"

  depends_on "go" => :build

  go_resource "github.com/tools/godep" do
    url "https://github.com/tools/godep.git",
      :revision => "5598a9815350896a2cdf9f4f1d0a3003ab9677fb"
  end

  def install
    system "./build"
    bin.install "bin/certstrap"
  end

  test do
    system "#{bin}/certstrap", "init", "--common-name", "test", "--passphrase", "blah"
  end
end
