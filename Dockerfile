FROM golang:latest
RUN apt update && apt install -y curl wget gcc g++ make git screen
# ARG CHAIN_ID="axelar-testnet-lisbon-3"
# ARG CHAIN_HOME=".axelar_testnet"
# ARG CHAIN_DENOM="uaxl"
# ARG AXELARD_BINARY_NAME="axelard"
# ARG AXELARD_BINARY_VERSION="v0.31.2"
# ARG AXELARD_BINARY_PATH="$HOME/$CHAIN_HOME/bin/$AXELARD_BINARY_NAME"
# RUN git clone https://github.com/axelarnetwork/axelar-core.git && cd axelar-core && git checkout "$AXELARD_BINARY_VERSION" && make build &&  cp bin/axelard "$HOME/$CHAIN_HOME/bin/axelard"
WORKDIR /axelar
COPY script.sh script.sh
RUN chmod +x script.sh
CMD ./axelard start --home "$HOME/$CHAIN_HOME" --moniker "$NODE_MONIKER" || sleep infinity
