ARG REDIS_VERSION
ARG TZ

FROM ${REDIS_VERSION}

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
