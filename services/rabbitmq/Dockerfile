ARG RABBITMQ_VERSION
ARG TZ

FROM ${RABBITMQ_VERSION}

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
