class Itermocil < Formula
  include Language::Python::Virtualenv

  desc "Allows you setup pre-configured layouts of panes in iTerm2"
  homepage "https://github.com/TomAnthony/itermocil"
  url "https://github.com/TomAnthony/itermocil/archive/1.0.3.tar.gz"
  sha256 "9810fc457bc6430f49f8eee32ceb6d56e316d8fda2ddcb8172b0ead1c025fd59"
  license "MIT"

  depends_on "python@3.10"

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/36/2b/61d51a2c4f25ef062ae3f74576b01638bebad5e045f747ff12643df63844/PyYAML-6.0.tar.gz"
    sha256 "68fb519c14306fec9720a2a5b45bc9f0c8d1b9c72adf45c37baedfcd949c35a2"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/itermocil", "-h"
  end
end
