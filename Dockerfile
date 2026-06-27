FROM ghcr.io/github/github-mcp-server AS mcp
FROM node:20-alpine
RUN npm install -g supergateway
COPY --from=mcp /github-mcp-server /usr/local/bin/github-mcp-server
ENV PORT=8080
EXPOSE 8080
CMD ["sh", "-c", "supergateway --port $PORT --stdio 'github-mcp-server stdio'"]
