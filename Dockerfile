FROM tomcat:8-jre8
COPY ./target/webapp-1.war /usr/local/tomcat/webapps
