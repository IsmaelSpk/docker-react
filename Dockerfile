FROM node:alpine AS builder

WORKDIR /app/
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx

#this EXPOSE below is for the elastic beanstalk. This not working in env dev
EXPOSE 80
COPY --from=builder /app/build usr/share/nginx/html

#Dockerfile for deployment
#docker run -p 8080:80 <image_hash>