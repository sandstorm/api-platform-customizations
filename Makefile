gen-patches:
	cd patch-gen; diff -ur 00* 01* > ../01_fix_docker_container_restart.patch ||:
	cd patch-gen; diff -ur 01* 02* > ../02_api_subdirectory.patch ||:
	cd patch-gen; diff -ur 02* 03* > ../03_combine_nginx_php.patch ||:
	cd patch-gen; diff -ur 03* 04* > ../04_disable_vulcain_mercure_varnish.patch ||:
