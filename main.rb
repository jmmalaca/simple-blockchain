require "./blockchain.rb"

blockchain = Blockchain.new
blockchain.add_new_block("the new kid on the block")
blockchain.add_new_block("learning about blockchain")
blockchain.add_new_block("make me a new hash!!")
# blockchain.add_new_block("and another one...")

blockchain.all_blocks
