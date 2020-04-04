# API Platform Customizations

We've recently tried out API Platform - a REST and GraphQL Framework based on Symfony and React,
and we are extremely happy with using it so far.

There are some details which we like to change from the default API Platform configuration; so this
repo contains the patches to be applied on a stock API platform template:

- 01_fix_docker_container_restart.patch

## Development

```
make gen-patches
```
