FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# nginx serves for the production website
# it simply copies from previous stage; builder's app/build directory to theusr/share/nginx/html directory
 
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html