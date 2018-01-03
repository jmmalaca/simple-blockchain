require "digest"

class Blockchain

  def initialize(difficulty = "00")
    @blocks = []
    @difficulty = difficulty
    hash_block("I'm the Genesis block")
  end

  def add_new_block(data)
    hash_block(data, last_hash, @blocks.length)
  end

  def all_blocks
    @blocks
  end

  private

  def hash_block(data, previous_hash=0, index=0)
    hash = ""
    nonce = 1

    while(!valid_hash? hash)
      input = "#{data}#{timestamp}#{previous_hash}#{index}#{nonce}"
      hash = encode input
      nonce += 1
    end

    @blocks << hash
    {hash: hash, nonce: nonce}
  end

  def encode(input)
    Digest::SHA256.base64digest input
  end

  def valid_hash?(hash)
    hash.start_with? @difficulty
  end

  def last_hash
    @blocks.last
  end

  def timestamp
    Time.now.getutc
  end
end
