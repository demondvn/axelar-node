# axelar-node

### build
    docker build . -t axelar --build-arg AXELARD_BINARY_VERSION="v0.31.3"
  
<!-- ## Init run only first time
### setup
    docker run -it --rm --name axelar_tmp -v /mnt/blockstore/axelar:/root/.axelar_testnet --entrypoint /axelar/script.sh axelar_tmp
### commit 
    docker commit axelar_tmp axelar 
-->
### snapshot
    apt install axel tar lz4 -y
    SNAP_NAME=$(curl -s https://snapshots-testnet.nodejumper.io/axelar-testnet/info.json | jq -r .fileName)
    axel -a -n 50 "https://snapshots-testnet.nodejumper.io/axelar-testnet/${SNAP_NAME}" 
    tar -I lz4 -xf ${SNAP_NAME} -C "/mnt/blockstore/axelar" 
<!--     lz4 -dc $SNAP_NAME | tar -xf $SNAP_NAME -C "/mnt/blockstore/axelar"  -->
## run
    docker run -d --name axelar -e MONIKER="MonPham" -e PASSWORD="password" -v /mnt/blockstore/axelar:/root/.axelar_testnet -p 26656:26656 -p 26657:26657 axelar
    
