# To run server.sh

`bash server.sh`

# To build image

`docker build -t "sbws" .`

# To run docker image

`docker run -d --rm -p 3000:3000 --name simple-bash-webserver sbws`
