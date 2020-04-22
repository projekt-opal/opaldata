FROM maven:3-jdk-8

RUN wget https://github.com/projekt-opal/web-service/archive/replace_fuseki_by_ES.zip && unzip replace_fuseki_by_ES.zip && cd web-service-replace_fuseki_by_ES && mvn clean package

CMD cd web-service-replace_fuseki_by_ES && java -jar target/webservice-1.0.0.jar
