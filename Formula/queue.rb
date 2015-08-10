class Queue < Formula
  #desc "A simple set of scripts that allow you to create a 'command queues'."
  homepage "https://github.com/TomAnthony/queue"
  url "https://github.com/TomAnthony/queue/archive/0.1.0.tar.gz"
  sha256 "beb61024162c6ffe3c6f4ca3b338fe01ae2f559ff0b2d8e4abc942b4a734eec0"

  def install

    bin.install "qcreate"
    bin.install "qtrigger"
    bin.install "qwait"

  end

  test do
    system "#{bin}/qcreate", "test"
  end
end

