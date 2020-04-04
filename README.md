# API Platform Customizations

We've recently tried out API Platform - a REST and GraphQL Framework based on Symfony and React,
and we are extremely happy with using it so far.

There are some details which we like to change from the default API Platform configuration; so this
repo contains the patches to be applied on a stock API platform template:

## Fixing Docker Container Restart (API Platform 2.5 Hotfix)

```
curl -L https://github.com/sandstorm/api-platform-customizations/raw/master/01_fix_docker_container_restart.patch | patch -p1
git add .
git commit -m "BUGFIX: apply 01_fix_docker_container_restart.patch"
```

We had some trouble in restarting all containers, i.e. when doing docker-compose stop and then again docker-compose up, not all containers would come up. Specifically, the mercure and vulcain containers would exit, complaining about not-found SSL certificates.

Further investigation shows that the SSL certificates are generated by the dev-tls container, but the client container overwrites/removes them on startup.

We simply set the dev-certs volume to read-only. This issue has been fixed in the [API-Platform master branch](https://github.com/api-platform/api-platform/commit/ef05822b07ca57eb28665fe965043961373661e5#diff-4e5e90c6228fd48698d074241c2ba760) already, so the fix will be included in API-Platform 2.6.

## Moving the API into the /api sub-path

```
curl -L https://github.com/sandstorm/api-platform-customizations/raw/master/02_api_subdirectory.patch | patch -p1
git add .
git commit -m "TASK: apply 02_api_subdirectory.patch"
```

## Combine Nginx and PHP

```
curl -L https://github.com/sandstorm/api-platform-customizations/raw/master/03_combine_nginx_php.patch | patch -p1
git add .
git commit -m "TASK: apply 03_combine_nginx_php.patch"
```

## Disable Vulcain, Mercure and Varnish

```
curl -L https://github.com/sandstorm/api-platform-customizations/raw/master/04_disable_vulcain_mercure_varnish.patch | patch -p1
git add .
git commit -m "TASK: apply 04_disable_vulcain_mercure_varnish.patch"
```

## Add Production config

docker build --target api_platform_php -t scheduleplanning-api api/
docker build --target api_platform_admin_nginx -t scheduleplanning-admin admin/
docker build --target api_platform_client_nginx -t scheduleplanning-client client/
docker build -t scheduleplanning docker/prod

## Development

```
make gen-patches
```
