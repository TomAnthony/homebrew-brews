class Queue < Formula
  #desc "A simple set of scripts that allow you to create a 'command queues'."
  homepage "https://github.com/TomAnthony/queue"
  url "https://github.com/TomAnthony/queue/archive/0.1.3.tar.gz"
  sha256 "bfbaf7fefe967cff939f1f1178ea39162fef15222d587cd44f9f03d97b632e01"

  def install

    bin.install "qset"
    bin.install "qtrigger"
    bin.install "qwait"

  end

  test do
    system "#{bin}/qtrigger", "test"
  end
end

