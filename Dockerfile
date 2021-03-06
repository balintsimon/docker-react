#FROM node:alpine AS builder
FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
#AWS looks for expose (other services do not)
EXPOSE 80
#COPY --from=builder /app/build /usr/share/nginx/html
COPY --from=0 /app/build /usr/share/nginx/html