class Itermocil < Formula
  include Language::Python::Virtualenv

  desc "Allows you setup pre-configured layouts of panes in iTerm2"
  homepage "https://github.com/TomAnthony/itermocil"
  url "https://github.com/TomAnthony/itermocil/archive/1.0.3.tar.gz"
  sha256 "9810fc457bc6430f49f8eee32ceb6d56e316d8fda2ddcb8172b0ead1c025fd59"
  license "MIT"

  depends_on "python@3.10"

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/cd/e5/af35f7ea75cf72f2cd079c95ee16797de7cd71f29ea7c68ae5ce7be1eda0/PyYAML-6.0.1.tar.gz"
    sha256 "bfdf460b1736c775f2ba9f6a92bca30bc2095067b8a9d77876d1fad6cc3b4a43"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/itermocil", "-h"
  end
end
