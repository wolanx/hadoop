FROM openjdk:11

MAINTAINER wolanx (https://wolanx.com)

ADD https://dlcdn.apache.org/hadoop/common/hadoop-3.3.2/hadoop-3.3.2.tar.gz /etc/hadoop/

ENV PATH $PATH:/etc/hadoop/hadoop-3.3.2/bin

#RUN curl -s -L -o hadoop.tar.gz \
#    'https://dlcdn.apache.org/hadoop/common/hadoop-3.3.2/hadoop-3.3.2.tar.gz' \
#    && mkdir /hadoop \
#    && tar -xf hadoop.tar.gz -C /hadoop --strip-components 1 \
#    && rm -f hadoop.tar.gz

COPY conf /etc/hadoop/conf
COPY entrypoint.sh /
RUN ls -l /hadoop

EXPOSE 8020 8042 8088 9000 9868 9870 10020 19888 50010 50020 50090

CMD ["/entrypoint.sh"]

# docker build -t wolanx/hadoop .
