class Itermocil < Formula
  # desc "iTermocil allows you setup pre-configured layouts of panes in iTerm2."
  homepage "https://github.com/TomAnthony/itermocil"
  url "https://github.com/TomAnthony/itermocil/archive/1.0.0.tar"
  sha256 "60c1774d7d482b65e49c7599ba6e445c9f7fa6740c39555fc6454f21d9be6558"

  resource "PyYAML" do
    url "https://pypi.python.org/packages/source/P/PyYAML/PyYAML-3.11.tar.gz"
    sha256 "c36c938a872e5ff494938b33b14aaa156cb439ec67548fcab3535bb78b0846e8"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python3.9/site-packages"

    %w[PyYAML].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python3.9/site-packages"
    system "python", *Language::Python.setup_install_args(libexec)

    bin.install "itermocil"
    bin.install "itermocil.py"

    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "#{bin}/itermocil", "-h"
  end
end
