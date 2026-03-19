podman stop nginx
podman rm nginx
podman run -it -d --name nginx --network host --restart always -v $PWD/nginx.conf:/etc/nginx/nginx.conf:Z -v $PWD:/local/nginx:Z  nginx:alpine
sleep 1
podman logs nginx
