class Itermocil < Formula
  desc "Termocil allows you setup pre-configured layouts of windows and panes in iTerm2, having each open in a specified directory and execute specified commands."
  homepage "https://github.com/TomAnthony/itermocil"
  url "https://github.com/TomAnthony/itermocil/archive/0.1.0.tar.gz"
  sha256 "464902145739f10155b3ba2c5482ca5e5f76032455d2935528d67421a03c7931"

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

    # libexec.install "PyYAML"
    bin.install "itermocil"
    bin.install "itermocil.py"

    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "#{bin}/itermocil", "-h"
  end
end

