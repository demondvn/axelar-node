FROM golang:latest
RUN apt update && apt install -y curl wget gcc g++ make git screen
# ARG CHAIN_ID="axelar-testnet-lisbon-3"
ARG CHAIN_HOME=".axelar_testnet"
ARG AXELARD_BINARY_VERSION="v0.31.2"
WORKDIR /axelar
RUN git clone https://github.com/axelarnetwork/axelar-core.git && cd axelar-core && git checkout "$AXELARD_BINARY_VERSION" && make build 
COPY script.sh script.sh
RUN chmod +x script.sh
CMD ./axelard start --home "$HOME/$CHAIN_HOME" --moniker "$NODE_MONIKER" || sleep infinity
