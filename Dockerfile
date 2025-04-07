FROM node:18 AS builder
WORKDIR /app

COPY . .
COPY .env .env  # 👈 確保把 .env 複製進來
RUN npm install
RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
