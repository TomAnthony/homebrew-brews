class Itermocil < Formula
  #desc "Termocil allows you setup pre-configured layouts of windows and panes in iTerm2."
  homepage "https://github.com/TomAnthony/itermocil"
  url "https://github.com/TomAnthony/itermocil/archive/0.1.3.tar.gz"
  sha256 "f5077ff501be217452b42dee975ad504e58a7ee416d4cd188f679ab52cec2967"

  resource "PyYAML" do
    url "https://pypi.python.org/packages/source/P/PyYAML/PyYAML-3.11.tar.gz"
    sha256 "c36c938a872e5ff494938b33b14aaa156cb439ec67548fcab3535bb78b0846e8"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    %w[PyYAML].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    ENV.prepend_create_path "PYTHONPATH", libexec

    bin.install "itermocil"
    bin.install "itermocil.py"

    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "#{bin}/itermocil", "-h"
  end
end

