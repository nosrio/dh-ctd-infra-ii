sh: 
	bash server.sh

build: 
	docker build -t "sbws" .

run:
	docker run -d --rm -p 3000:3000 --name simple-bash-webserver sbws

rm:
	docker rm -f simple-bash-webserver
