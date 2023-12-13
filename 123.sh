#!/bin/bash
sh -c "$(curl -sSfL https://release.solana.com/stable/install)"
export PATH="/root/.local/share/solana/install/active_release/bin:$PATH"
solana config set --url https://testnet.dev2.eclipsenetwork.xyz
solana-keygen new --no-bip39-passphrase > $HOME/solana_output.txt
solana airdrop 10
curl -s https://raw.githubusercontent.com/DOUBLE-TOP/tools/main/rust.sh | bash
curl -s https://raw.githubusercontent.com/DOUBLE-TOP/tools/main/node.sh | bash
source "$HOME/.cargo/env"
git clone https://github.com/solana-labs/example-helloworld
cd example-helloworld
npm install
npm run build:program-rust 
solana program deploy dist/program/helloworld.so >> $HOME/solana_output.txt 
npm run start
