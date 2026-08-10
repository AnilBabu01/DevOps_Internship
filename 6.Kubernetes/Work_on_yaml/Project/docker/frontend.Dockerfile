# =========================
# Stage 1: Build React App
# =========================
FROM node:22 AS build

WORKDIR /app

COPY Cricket-frontend/package*.json ./

RUN npm install

COPY Cricket-frontend/ .

RUN npm run build


# =========================
# Stage 2: Nginx
# =========================
FROM nginx:alpine

# Remove default nginx files
RUN rm -rf /usr/share/nginx/html/*

# Copy Vite production build
COPY --from=build /app/dist /usr/share/nginx/html

# SPA configuration
COPY Cricket-frontend/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]