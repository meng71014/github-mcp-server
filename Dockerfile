FROM node:20-alpine
RUN npm install -g supergateway
RUN apk add --no-cache curl
RUN curl -L https://github.com/github/github-mcp-server/releases/latest/download/github-mcp-server_Linux_x86_64.tar.gz | tar xz -C /usr/local/bin
ENV PORT=8080
EXPOSE 8080
CMD ["sh", "-c", "supergateway --port $PORT --stdio 'github-mcp-server stdio'"]
