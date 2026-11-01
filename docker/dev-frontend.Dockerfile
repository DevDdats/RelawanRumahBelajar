# DEVELOPMENT IMAGE. Source and node_modules are provided by Docker Compose volumes.
FROM node:22-alpine
WORKDIR /app
EXPOSE 3000
CMD ["npm", "run", "dev", "--", "--hostname", "0.0.0.0"]
