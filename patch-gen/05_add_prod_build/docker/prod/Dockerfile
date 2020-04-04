FROM api

COPY --from=admin /usr/src/admin/build /srv/api/public/admin
COPY --from=client /usr/src/client/build /srv/api/public/client

ENV APP_ENV=prod
ENV SHELL_VERBOSITY=3
