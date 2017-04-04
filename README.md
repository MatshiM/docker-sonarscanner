# Sonar Qube Scanner


[Sonar Scanning Examples](https://github.com/SonarSource/sonar-scanning-examples)

# Build

To build this scanner image, just issue a standard Docker build command:

    docker build -t burakince/sonarscanner .

# Usage

Run the following command from the command line to start the scanner.

    docker run -ti -v $(pwd):/root/src --link sonarqube --net dockersonarqube_default burakince/sonarscanner
