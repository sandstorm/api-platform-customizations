
echo "Will build image with tag $1"

docker build --target api_platform_php -t api api/
docker build --build-arg REACT_APP_API_ENTRYPOINT= --target api_platform_admin_nginx -t admin admin/
docker build --build-arg REACT_APP_API_ENTRYPOINT= --target api_platform_client_nginx -t client client/

docker build -t $1 docker/prod