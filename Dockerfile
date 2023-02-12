FROM golang:latest
RUN apt update && apt install -y curl wget gcc g++ make git screen
# ARG CHAIN_ID="axelar-testnet-lisbon-3"
ARG CHAIN_HOME=".axelar_testnet"
ARG AXELARD_BINARY_VERSION="v0.31.2"
WORKDIR /axelar
RUN git clone https://github.com/axelarnetwork/axelar-core.git && cd axelar-core && git checkout "$AXELARD_BINARY_VERSION" && make build 
COPY script.sh script.sh
RUN chmod +x script.sh
RUN apt install jq tar lz4 -y
# CMD screen -Smd tofn /usr/bin/sh -c 'echo "$TOFND_PASSWORD" | "$HOME/$CHAIN_HOME/bin/tofnd" -m existing -d $HOME/$CHAIN_HOME/.tofnd'
# CMD screen -Smd val /usr/bin/sh -c 'echo "$KEYRING_PASSWORD" | $AXELARD_BINARY_PATH vald-start --validator-addr \$(echo "$KEYRING_PASSWORD" | $AXELARD_BINARY_PATH keys show validator --home "$HOME/$CHAIN_HOME" --bech val -a) --log_level debug --chain-id $CHAIN_ID --from broadcaster --home "$HOME/$CHAIN_HOME"'
CMD ./axelard start --home "$HOME/$CHAIN_HOME" --moniker "$NODE_MONIKER" || sleep infinity
