FROM nginx:alpine
COPY . /usr/share/nginx/html
RUN echo "Image built on $(date)" > /usr/share/nginx/build_info.txt
EXPOSE 80
