# =========================
# Stage 1: Build React App
# =========================

FROM node:22 AS build

WORKDIR /app

COPY Cricket-Admin/package*.json ./

RUN npm install

COPY Cricket-Admin/ .

# API URL for Vite
ARG VITE_API_URL
ENV VITE_API_URL=$VITE_API_URL

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
COPY Cricket-Admin/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]