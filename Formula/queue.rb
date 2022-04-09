class Queue < Formula
  # desc "A simple set of scripts that allow you to create a 'command queues'."
  homepage "https://github.com/TomAnthony/queue"
  url "https://github.com/TomAnthony/queue/archive/0.1.5.tar.gz"
  sha256 "5c06b9ca293ec0b27f3c9f41c54986895ecb615ed64b3c531370e1f092720d3f"

  def install
    bin.install "q"
  end

  test do
    system "#{bin}/q", "-h"
  end
end
