gen-patches:
	cd patch-gen; diff -urN 00* 01* > ../01_fix_docker_container_restart.patch ||:
	cd patch-gen; diff -urN 01* 02* > ../02_api_subdirectory.patch ||:
	cd patch-gen; diff -urN 02* 03* > ../03_combine_nginx_php.patch ||:
	cd patch-gen; diff -urN 03* 04* > ../04_disable_vulcain_mercure_varnish.patch ||:
	cd patch-gen; diff -urN 04* 05* > ../05_add_prod_build.patch ||:
	cd patch-gen; diff -urN 05* 06* > ../06_add_mercure_hub_to_php_container.patch ||:
	cd patch-gen; diff -urN 06* 07* > ../07_add_vulcain_to_php_container.patch ||:
