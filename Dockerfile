FROM node:alpine as builder 
# build phase
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx 
# run phase
COPY --from=builder /app/build /usr/share/nginx/html

