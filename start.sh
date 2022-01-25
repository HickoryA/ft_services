minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb
minikube addons enable dashboard
kubectl apply -f configmap.yaml
#docker build -t wordpress-image ./srcs/wordpress/.

#docker build -t phpmyadmin-image ./srcs/phpmyadmin/.
#docker build -t mysql-image ./srcs/mysql/.
docker build -t nginx-image srcs/.
#docker build -t ftps-image ./srcs/ftps/.
#docker build -t grafana-image ./srcs/grafana/.
#docker build -t influxdb-image ./srcs/influxdb/.


#kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
#kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
#kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
#kubectl apply -f ./srcs/wordpress/wordpress.yaml
#kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
#kubectl apply -f ./srcs/mysql/mysql.yaml
#kubectl apply -f ./srcs/ftps/ftps.yaml
#kubectl apply -f ./srcs/ftps/ftpsload.yaml
kubectl apply -f srcs/nginx.yaml
#kubectl apply -f ./srcs/grafana/grafana.yaml
#kubectl apply -f ./srcs/grafana/grafanaload.yaml
#kubectl apply -f ./srcs/influxdb/volumedb.yaml
#kubectl apply -f ./srcs/influxdb/influxdb.yaml

#minikube dashboard
