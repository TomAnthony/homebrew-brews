class Queue < Formula
  #desc "A simple set of scripts that allow you to create a 'command queues'."
  homepage "https://github.com/TomAnthony/queue"
  url "https://github.com/TomAnthony/queue/archive/0.1.1.tar.gz"
  sha256 "480dda6609913066d80f3eb7fcbccaa8a3308e2c100929d249c0333a8e5425ae"

  def install

    bin.install "qcreate"
    bin.install "qtrigger"
    bin.install "qwait"

  end

  test do
    system "#{bin}/qcreate", "test"
  end
end

