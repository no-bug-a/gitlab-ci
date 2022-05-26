FROM openjdk:8-jre-alpine3.9

RUN echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/main' > /etc/apk/repositories \
    && echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/community' >>/etc/apk/repositories \
&& apk --no-cache add tzdata \
&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo "Asia/Shanghai" > /etc/timezone

ADD *.jar /app.jar
RUN apk add --update ttf-dejavu fontconfig
ENTRYPOINT ["java","-jar","/app.jar"]