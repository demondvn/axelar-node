# axelar-node

### build
    docker build . -t axelar_tmp
  
## Init run only first time
### setup
    docker run -it --rm --name axelar_tmp -v /mnt/blockstore/axelar:/root/.axelar_testnet --entrypoint /axelar/script.sh axelar_tmp
### commit 
    docker commit axelar_tmp axelar 
### snapshot
    SNAP_NAME=$(curl -s https://snapshots-testnet.nodejumper.io/axelar-testnet/info.json | jq -r .fileName)
    curl "https://snapshots-testnet.nodejumper.io/axelar-testnet/${SNAP_NAME}" | lz4 -dc - | tar -xf - -C "/mnt/blockstore/axelar"
## run
    docker run -d --name axelar -v /mnt/blockstore/axelar:/root/.axelar_testnet -p 26656:26656 -p 26657:26657 axelar
    
