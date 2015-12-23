FROM alpine

# Install cURL
RUN apk add --update curl && \
  rm -rf /var/cache/apk/*

# Java Version
ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 51
ENV JAVA_VERSION_BUILD 16
ENV JAVA_PACKAGE       server-jre

# Download and install java8, procps and bash
RUN apk add --update bash && \
  apk add --update curl && \
  apk add --update procps && \
  apk add --update libstdc++ && \
  curl -o glibc-2.21-r2.apk "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk" && \
  apk add --allow-untrusted glibc-2.21-r2.apk && \
  curl -o glibc-bin-2.21-r2.apk "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-bin-2.21-r2.apk" && \
  apk add --allow-untrusted glibc-bin-2.21-r2.apk && \
  /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib && \
  echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf &&\
  mkdir -p /opt &&\  
  curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie"\
    http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz \
    | gunzip -c - | tar -xf - -C /opt &&\
  ln -s /opt/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} /opt/jre &&\
  rm -rf /opt/jre/lib/plugin.jar \
    /opt/jre/lib/ext/jfxrt.jar \
    /opt/jre/bin/javaws \
    /opt/jre/lib/javaws.jar \
    /opt/jre/lib/desktop \
    /opt/jre/plugin \
    /opt/jre/lib/deploy* \
    /opt/jre/lib/*javafx* \
    /opt/jre/lib/*jfx* \
    /opt/jre/lib/amd64/libdecora_sse.so \
    /opt/jre/lib/amd64/libprism_*.so \
    /opt/jre/lib/amd64/libfxplugins.so \
    /opt/jre/lib/amd64/libglass.so \
    /opt/jre/lib/amd64/libgstreamer-lite.so \
    /opt/jre/lib/amd64/libjavafx*.so \
    /opt/jre/lib/amd64/libjfx*.so &&\
  apk del curl &&\
  rm -rf /var/cache/apk/*

ENV JAVA_HOME /opt/jre
