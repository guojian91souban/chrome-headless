FROM java:8-jdk

RUN mkdir /maven && \
    cd maven && wget -O maven.tar.gz  http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
    tar -zxf maven.tar.gz && rm -f maven.tar.gz 

COPY settings.xml /maven/apache-maven-3.3.9/conf

ENV PATH $PATH:/maven/apache-maven-3.3.9/bin/

RUN mkdir /chrome && cd /chrome && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt-get update -y && apt-get install -y gdebi-core && gdebi -n *.deb && \
    wget https://chromedriver.storage.googleapis.com/2.32/chromedriver_linux64.zip && \
    unzip *.zip && mv chromedriver /usr/local/bin && \  
    apt-get install -y git && \
    apt-get clean && apt-get autoclean && rm -f *.deb && rm -f *.zip


COPY fonts/winFonts/fonts/微软雅黑.ttf /usr/share/fonts

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
