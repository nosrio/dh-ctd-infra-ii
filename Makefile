build: 
	docker build -t "sbws" .

sh: 
	bash server.sh

run:
	docker run -d --rm -p 3000:3000 --name simple-bash-webserver sbws &

rm:
	docker rm -f simple-bash-webserver
