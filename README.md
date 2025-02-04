# docker_dev-environment

To build this image you want to replace the filename of the command with the local folder you are working from. The template would be docker build -t <filename> . --> In the case of this repository I would type the command in as;

docker build -t full-dev-env .

# Run Docker image
To run the docker image, you want to enter this command;
docker run -it --rm -v $(pwd):/workspace -p 5000:5000 <filename>

Run the docker image with a port using any language
docker run -it -p 8080:8080 --rm -v $(pwd):/workspace <filename>

in my case the command looks like this;
docker run -it --rm -v $(pwd):/workspace -p 5000:5000 full-dev-env

workspace is the containerized environment created within the dockerfile. This can be changed and everything can be tailored for any usecase of the packaging process. Also, the above command provides a port providing local hosting for webdevelopment utilizing the default ASP.net port.

# Create a project using one of the three languages!

# Create new ASP.NET project
dotnet new webapp -o MyWebApp

# Create Node.js project
npm init -y

# Create Python virtual environment
python -m venv .venv

I incorporated Ubuntu 22.04 which is the latest version currently. Here are some pros and cons!

Pros of Using ubuntu:latest
✔ Always up to date – You’ll get the newest Ubuntu version automatically.
✔ Latest security patches – Newer packages and libraries.
✔ Future-proofing – Avoids using outdated dependencies.

Cons of Using ubuntu:latest
❌ Possible breaking changes – Newer Ubuntu versions may not be backward-compatible, leading to issues with package installations.
❌ Unstable dependencies – Some packages may not yet be fully supported in the latest release.
❌ Rebuild required for stability – Every time a new Ubuntu version is released, you may need to adjust your Docker setup.

# Commands to run a basic program within each language of this environment
gcc myfile.c -o myprogram
./myprogram
g++ myfile.cpp -o myprogram
./myprogram
node --version
node myscript.js
python3 --version
python3 myscript.py
pip install flask  # Install Python packages
dotnet new console -o MyApp
cd MyApp
dotnet run

#Saving your work within the container

*Container ID*
docker ps -a

*Commit Container as an Image*
docker commit <container_id> my-custom-dev-env

*Run your image later*
docker run -it my-custom-dev-env

#Use VS code to start a project with local hosting
code .
