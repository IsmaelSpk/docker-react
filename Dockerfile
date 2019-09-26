FROM node:alpine AS builder

WORKDIR /app/
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build usr/share/nginx/html


#Dockerfile for deployment
#docker run -p 8080:80 <image_hash>