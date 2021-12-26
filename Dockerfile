# builder stage
FROM node:alpine as builder

WORKDIR /usr/app
COPY package.json .
RUN npm i
COPY . .

RUN npm run build


# runner stage
FROM nginx as runner

WORKDIR /usr/share/nginx/html
COPY --from=builder /usr/app/build .
