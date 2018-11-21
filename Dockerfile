FROM tomcat:8.5

ENV OLS_HOME /opt/ols

#ADD ols-apps/ols-config-importer/src/main/resources/ols-config.yaml ${OLS_HOME}
ADD ols-web/src/main/resources/application.properties ${OLS_HOME}

# bootstrap files
#RUN mkdir ${OLS_HOME}/ontologies
#ADD *.owl ${OLS_HOME}/ontologies/
#RUN ls -l ${OLS_HOME}/ontologies/

# Remove all (default) app from tomcat
RUN rm -fr ${CATALINA_HOME}/webapps/*

# Allow tomcat to read and exec files in webapps (sub)folder
RUN chmod -R 2755 webapps ${CATALINA_HOME}/webapps

# Copy war-file to webapps
COPY ols-web/target/ols-boot.war ${CATALINA_HOME}/webapps/ROOT.war