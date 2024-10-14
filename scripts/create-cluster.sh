# Creación de un cluster EKS

eksctl create cluster \
--name eks-mundos-e \
--region us-east-1 \
--node-type t3.small \
--nodes 3 \
--with-oidc \
--ssh-access \
--ssh-public-key script-user-data \
--managed \
--full-ecr-access \
--zones us-east-1a,us-east-1b,us-east-1c


# Despliegue de un servicio en el cluster

## 1 --> Configura kubectl para acceder a tu clúster:
aws eks --region us-east-1 update-kubeconfig --name eks-mundos-e

## 2 --> Despliega NGINX:
kubectl create deployment nginx --image=nginx

## 3 --> Verifica que el pod esté corriendo:
kubectl get pods

## Primero, vamos a exponer el deployment de NGINX como un servicio
kubectl expose deployment nginx --type=LoadBalancer --port=80

## Ahora, obtengamos la dirección del LoadBalancer:
kubectl get services


# Una vez que tengas la dirección EXTERNAL-IP, puedes verificar NGINX de varias maneras:
# a. Usando curl desde tu instancia EC2:

curl http://a55a0682150324c998db514017dfac35-1855082962.us-east-1.elb.amazonaws.com/

# HASTA ACA ANDA TODO

# Si quieres verificar los logs de NGINX, puedes usar:

kubectl logs deployment/nginx

#Para obtener más detalles sobre el pod de NGINX:
kubectl describe pod $(kubectl get pods -l app=nginx -o jsonpath="{.items[0].metadata.name}")

# kubectl delete service nginx
kubectl delete service nginx

#Y eliminar el deployment con:
kubectl delete deployment nginx