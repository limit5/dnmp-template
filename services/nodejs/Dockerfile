ARG NODEJS_VERSION
ARG TZ

FROM ${NODEJS_VERSION}

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
