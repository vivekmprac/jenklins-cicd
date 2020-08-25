FROM tomcat:8.0.20-jre8
COPY target/webapp*.war /usr/local/tomcat/webapps/webapp.war
