docker build -t ulrichjohannes/multi-client -f ./client/Dockerfile ./client
docker build -t ulrichjohannes/multi-server -f ./server/Dockerfile ./server
docker build -t ulrichjohannes/multi-worker -f ./worker/Dockerfile ./worker
docker push ulrichjohannes/multi-client
docker push ulrichjohannes/multi-server
docker push ulrichjohannes/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=ulrichjohannes/multi-server