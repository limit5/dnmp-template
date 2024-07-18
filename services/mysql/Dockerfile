ARG MYSQL_VERSION
ARG TZ

FROM ${MYSQL_VERSION}

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#RUN chmod 770 /var/log/mysql/