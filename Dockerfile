# uygulama için jdk gerekli
FROM openjdk:21

# bizim projemizdeki JAR dosyamızın Docker içinde çalışacağı konum
ARG JAR_FILE=target/*.jar

#Jar dosyasını bu isimle Docker'ın içine kopyala
COPY ${JAR_FILE} application.jar

# terminal komutları için CMD kullanılır
CMD apt-get update -y

# projenin çalışacağı iç port
EXPOSE 8080

# uygylamanın çalışmasını sağlar
ENTRYPOINT ["java","-jar","application.jar"]