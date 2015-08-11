class Queue < Formula
  #desc "A simple set of scripts that allow you to create a 'command queues'."
  homepage "https://github.com/TomAnthony/queue"
  url "https://github.com/TomAnthony/queue/archive/0.1.2.tar.gz"
  sha256 "d50e6bd775914a2f381fcd65db1f1baf6a88690374119ed4a9e697d6d29ddd96"

  def install

    bin.install "qset"
    bin.install "qtrigger"
    bin.install "qwait"

  end

  test do
    system "#{bin}/qtrigger", "test"
  end
end

