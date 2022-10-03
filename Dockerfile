FROM node:lts-alpine as builder

WORKDIR /app
COPY package*.json ./

RUN npm install
COPY . .
RUN npm run build


FROM nginx:stable-alpine
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/nginx/default.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app/nginx/sites-available /etc/nginx/sites-available
COPY --from=builder /app/nginx/sites-enabled /etc/nginx/sites-enabled

RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]