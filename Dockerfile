# Originally created by @alexandrebodin

ARG BASE_VERSION
#FROM strapi/base:${BASE_VERSION}
FROM node:${BASE_VERSION}

ARG STRAPI_VERSION
#RUN yarn global add strapi@${STRAPI_VERSION} --ignore-engines
RUN yarn global add strapi --ignore-engines


#ARG USER_NAME
#RUN useradd -ms /bin/bash ${USER_NAME}
#RUN mkdir -p /srv/app && chown 1000:1000 -R /srv/app
#RUN mkdir -p /home/${USER_NAME} && chown 1000:1000 -R /home/${USER_NAME}

WORKDIR /srv/app

VOLUME /srv/app

COPY strapi-entrypoint.sh /usr/local/bin/
RUN ["chmod", "+x", "/usr/local/bin/strapi-entrypoint.sh"]
ENTRYPOINT ["/usr/local/bin/strapi-entrypoint.sh"]

CMD ["strapi", "develop"]
