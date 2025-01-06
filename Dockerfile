FROM openjdk:17
ADD https://akhildocker.s3.ap-south-1.amazonaws.com/gameoflife.war /app/gameoflife.war
EXPOSE 8080
CMD ["java", "-jar", "/gameoflife.war"] 