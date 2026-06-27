FROM node:20-alpine
RUN npm install -g supergateway
RUN apk add --no-cache curl tar
RUN curl -L https://github.com/github/github-mcp-server/releases/latest/download/github-mcp-server_Linux_x86_64.tar.gz -o /tmp/mcp.tar.gz && tar xz -C /usr/local/bin -f /tmp/mcp.tar.gz
EXPOSE 8080
ENTRYPOINT ["supergateway", "--port", "8080", "--stdio", "github-mcp-server stdio", "--outputTransport", "streamableHttp", "--stateless"]
