docker build -t itsadeadh2/complex-client:latest -t itsadeadh2/complex-client:$SHA -f ./client/Dockerfile ./client
docker build -t itsadeadh2/complex-server:latest -t itsadeadh2/complex-server:$SHA -f ./server/Dockerfile ./server
docker build -t itsadeadh2/complex-worker:latest -t itsadeadh2/complex-worker:$SHA -f ./worker/Dockerfile ./worker
docker push itsadeadh2/complex-client
docker push itsadeadh2/complex-server
docker push itsadeadh2/complex-worker
kubectl apply -f  k8s
kubectl set image deployments/server-deployment server=itsadeadh2/complex-server:$SHA
kubectl set image deployments/client-deployment client=itsadeadh2/complex-client:$SHA
kubectl set image deployments/worker-deployment worker=itsadeadh2/complex-worker:$SHA