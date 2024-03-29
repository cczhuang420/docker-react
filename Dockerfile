FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm i
COPY . .

RUN npm run build

# /app/build <--- all the stuff we care about 

FROM nginx
EXPOSE 80
COPY  --from=builder /app/build /usr/share/nginx/html
