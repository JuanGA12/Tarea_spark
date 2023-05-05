FROM ubuntu:20.04
ARG SPARK_VERSION
COPY check_spark_version.sh /usr/local/bin/check_spark_version.sh
RUN chmod +x /usr/local/bin/check_spark_version.sh

RUN check_spark_version.sh $SPARK_VERSION

RUN apt-get update && \
    apt-get install -y python openjdk-8-jdk wget curl vim

RUN wget https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop1.tgz && \
    tar -xvzf spark-$SPARK_VERSION-bin-hadoop1.tgz && \
    mv spark-$SPARK_VERSION-bin-hadoop1 /usr/local/spark && \
    rm spark-$SPARK_VERSION-bin-hadoop1.tgz

ENV SPARK_HOME=/usr/local/spark
ENV PATH=$PATH:$SPARK_HOME/bin
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

COPY wordcount.py /usr/local/spark/examples/src/main/python/

WORKDIR /usr/local/spark/examples/src/main/python/
