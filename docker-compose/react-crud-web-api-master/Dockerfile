# Sử dụng hình ảnh chính thức của Node.js làm hình ảnh cơ bản
FROM node:14

# Đặt thư mục làm việc trong container
WORKDIR /usr/src/app

# Sao chép file package.json và package-lock.json vào thư mục làm việc
COPY package*.json ./

# Cài đặt các dependencies
RUN npm install

# Sao chép tất cả các file và thư mục từ thư mục hiện tại vào thư mục làm việc trong container
COPY . .

# Build ứng dụng cho production
RUN npm run build

# Cài đặt server web tĩnh để phục vụ ứng dụng React
RUN npm install -g serve

# Sử dụng lệnh để chạy ứng dụng
CMD ["serve", "-s", "build"]

# Expose port 3000 để ứng dụng có thể truy cập từ bên ngoài container
EXPOSE 3000
#
## Stage 1: Build the application
#FROM node:14 AS build
#
## Set the working directory
#WORKDIR /usr/src/app
#
## Copy the package.json and package-lock.json files
#COPY package*.json ./
#
## Install dependencies
#RUN npm install
#
## Copy all the files and folders from the current directory to the working directory in the container
#COPY . .
#
## Build the application for production
#RUN npm run build
#
## Stage 2: Serve the application
#FROM nginx:alpine
#
## Copy the custom nginx configuration file
#COPY nginx.conf /etc/nginx/nginx.conf
#
## Copy the build output from the previous stage to the Nginx HTML directory
#COPY --from=build /usr/src/app/build /usr/share/nginx/html
#
## Expose port 80 to make the application accessible from outside the container
#EXPOSE 80
#
## Start Nginx server
#CMD ["nginx", "-g", "daemon off;"]
#
#
# Stage 1: Build the Angular application
#FROM node:14 AS build
#
#WORKDIR /app
#
#COPY package*.json ./
#RUN npm install
#
#COPY . .
#RUN npm run build --prod
#
## Stage 2: Serve the Angular application with Nginx
#FROM nginx:alpine
#
#COPY --from=build /app/dist/your-angular-app /usr/share/nginx/html
#COPY nginx.conf /etc/nginx/nginx.conf
#
#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]