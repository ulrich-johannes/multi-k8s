docker build -t ulrichjohannes/multi-client -f ./client/Dockerfile ./client
docker build -t ulrichjohannes/multi-server -f ./server/Dockerfile ./server
docker build -t ulrichjohannes/multi-worker -f ./worker/Dockerfile ./worker