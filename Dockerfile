FROM openjdk:8

MAINTAINER Burak Ince <burak.ince@linux.org.tr>

ENV SONAR_SCANNER_CLI_VERSION=3.0.0.702 \
    SONAR_SCANNER_HOME=/opt/sonar-scanner

RUN set -x \
	&& cd /opt \
	&& curl -o sonar-scanner.zip -fSL https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SONAR_SCANNER_CLI_VERSION-linux.zip \
	&& unzip sonar-scanner.zip \
	&& mv sonar-scanner-$SONAR_SCANNER_CLI_VERSION-linux sonar-scanner \
	&& rm sonar-scanner.zip*

ENV PATH /opt/sonar-scanner/bin/:$PATH

COPY sonar-scanner.properties $SONAR_SCANNER_HOME/conf/sonar-scanner.properties

WORKDIR $SONAR_SCANNER_HOME
COPY run.sh $SONAR_SCANNER_HOME/bin/
ENTRYPOINT ["./bin/run.sh"]