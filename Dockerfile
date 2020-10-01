# This is a multistep process: build phase and run phase.

# Build phase
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# /app/build will be the result that I want.

# Run phase
FROM nginx
EXPOSE 80
WORKDIR '/app/build'
# The destination directory comes from nginx documentation.
COPY --from=0 /app/build /usr/share/nginx/html