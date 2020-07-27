docker build -t ulrichjohannes/multi-client:latest -t ulrichjohannes/multi-client:$SHA  -f ./client/Dockerfile ./client
docker build -t ulrichjohannes/multi-server -t ulrichjohannes/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t ulrichjohannes/multi-worker -t ulrichjohannes/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push ulrichjohannes/multi-client:latest
docker push ulrichjohannes/multi-server:latest
docker push ulrichjohannes/multi-worker:latest
docker push ulrichjohannes/multi-client:$SHA
docker push ulrichjohannes/multi-server:$SHA
docker push ulrichjohannes/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=ulrichjohannes/multi-server:$SHA
kubectl set image deployments/worker-deployment server=ulrichjohannes/multi-worker:$SHA
kubectl set image deployments/client-deployment server=ulrichjohannes/multi-client:$SHA
