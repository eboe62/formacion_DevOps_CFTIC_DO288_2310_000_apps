# DO288 Containerized Example Applications

This repository contains a collection of sample containerized applications.  To complete the course you need to fork this repo into your personal Github account.

DO288 - EJERCICIOS 				Last Update: 27-Diciembre-2023	20:05	OCP 4.12-en3
===================

* Creación del entorno para los ejercicios
  ----------------------------------------
En la workstation donde se quiera realizar los ejercicios hay que configurar el entorno de la siguiente manera:


	

	1.- Deshacer el tar de los ficheros suministrados en el /tmp de la workstation:
		
		mkdir ~/DO288
		cd /tmp
		wget <URL_fich_suministrados>
		tar xvf fichs-DO288.tar; rm fichs-DO288.tar
		mv /tmp/DO288-apps/labs ~/DO288/
		mv /tmp/DO288-apps/solutions ~/DO288/
	
	2.- En el GitHub del alumno, crear un repositorio público vacío llamado "DO288-apps" y:

		cd ~
		git clone https://github.com/<USUARIO_GIT>/DO288-apps
		cd DO288-apps
		mv /tmp/DO288-apps/apps/* ./
		git add .
		git commit -m "Copiado de ficheros"
		git push

    	    Ahora en este repositorio de GitHub del alumno, están los códigos fuente de las apps necesarias para los ejercicios del PDF.
   
   NOTAS:  
	* Repositorio GIT: en lugar de usar "git.ocp4.example.com/developer/DO288-apps", usar el del alumno "https://github.com/<USER>/DO288-apps".

	* Registry de IC: En lugar de usar el registry privado en "registry.ocp4.example.com:8443, usar "quay.io/<USER>/ 



-------
Tema 1
-------

	* Ejercicio 1: Setting up the Developer Environment	-
  	  - Start:
		oc new-project architecture-setup

	    NOTA: Saltar el punto 1 y 2.
          En la cuenta Quay del usuario, crear un repositorio llamado "hello-flask" y hacerlo público:
		Pulsar en "+ Create New Repository" -> en "Repository Name" poner "hello-flask" y marcar "Public", dejar seleccionado "(Empty Repository)"
		 y pulsar el botón "Create Public Repository"

	  En fichero "~/DO288/labs/architecture-setup/hello-flask/devfile.yaml", línea 72:
	  cambiar "registry.ocp4.example.com:8443/developer/hello-flask"  por
		  "quay.io/<USER>/hello-flask"

	 En fichero "~/DO288/labs/architecture-setup/hello-flask/kubernetes/deploy.yaml", línea 41:
	  cambiar "registry.ocp4.example.com:8443/developer/hello-flask/"  por
		  "quay.io/<USER>/hello-flask"

	  - Finish:
		oc delete project architecture-setup
-------
Tema 2
-------
	* Ejercicio 1: Navigating the Red Hat OpenShift Web Console
	  - Start:
		oc new-project deploy-introduction
		oc create -f /tmp/DO288-apps/kubefiles/deploy-instroduction/sample-node-app.yaml
	
	  - Finish: 
		oc delete project deploy-introduction
	
	* Ejercicio 2: Deploying Applications by Using the Red Hat OpenShift Web Console
	  - Start:
		oc new-project deploy-console

	  GIT: En lugar de "https://git.ocp4.example.com/developer/DO288-apps.git" usar:
			 "https://github.com/<USER>/DO288-apps.git"

	  IC: en lugar de "registry.ocp4.example.com:8443/redhattraining/openshift-dev-deploy-console-todo-list"  usar 
		          "quay.io/redhattraining/openshift-dev-deploy-console-todo-list"

	  - Finish: 
		oc delete project deploy-console

	* Ejercicio 3: Deploying Applications by Using the oc and odo CLIs
	  - Start:
		oc new-project deploy-cli

	  Punto 2.1: en lugar de "registry.ocp4.example.com:8443/redhattraining/openshift-dev-deploy-cli-weather:1.0"   usar
	     		  "quay.io/redhattraining/openshift-dev-deploy-cli-weather:1.0"   

	  - Finish: 
		oc delete project deploy-cli
		oc delete project odo-deploy-cli

	* Lab: Deploying Simple Applications
	  - Start:
		oc new-project deploy-review

	IC: en lugar de "registry.ocp4.example.com:8443/redhattraining/openshift-dev-deploy-review-todo-list"  usar
		        "quay.io/redhattraining/openshift-dev-deploy-review-todo-list"

	  - Finish:
		oc delete project deploy-review
		
-------
Tema 3
-------
	* Ejercicio 1: Building Container Images for Red Hat OpenShift
	  - Start:
		oc new-project images-ubi

	Punto 2.2: En lugar de crear la IC con nombre "registry.ocp4.example.com:8443/developer/images-ubi-greetings:1.0.0", usar 
	   "quay.io/<USUARIO>/images-ubi-greetings:1.0.0". Hacer lo mismo en punto 4.4 y 6.2 cuando la IC se versione a 1.0.1.
	      Entrar en Quay.io y poner la imagen como pública.     

	Punto 3.3 y 4.1: en lugar de "registry.ocp4.example.com:8443/developer/images-ubi-greetings:1.0.0" usar "quay.io/<USER>/images-ubi-greetings:1.0.0"
	Punto 4.5, 5.2, 5.3, 6.3, 6.5 y 7.1 en lugar de "registry.ocp4.example.com:8443/developer/images-ubi-greetings:1.0.1" usar "quay.io/<USER>/images-ubi-greetings:1.0.1"

	  - Finish: 
		oc delete project images-ubi

	* Ejercicio 2: Using External Registries in Red Hat OpenShift
	  - Start:
		oc new-project images-registry

	Punto 3.1 y 5.1: en --docker-server, poner "quay.io" en lugar de "registry.ocp4.example.com:8443", (en 3.1 poner mal la password del usuario de quay)
	Pasos extra: Hacer:  podman login -u <USER> -p <PASSWORD> quay.io
			     podman pull quay.io/redhattraining/hello-world-nginx:latest
			     podman tag quay.io/redhattraining/hello-world-nginx:latest quay.io/<USER>/hello-world-nginx:latest
			     podman push quay.io/<USER>/hello-world-nginx:latest			-> NO HACER PUBLICA ESTA IMAGEN
	
	Punto 4.1: en lugar de "registry.ocp4.example.com:8443/redhattraining/hello-world-nginx:latest" usar
	 		"quay.io/<USER>/hello-world-nginx:latest"

	  - Finish: 
		oc delete project images-registry
		skopeo delete docker://quay.io/<USER>/hello-world-nginx:latest
		podman rmi quay.io/<USER>/hello-world-nginx:latest

	* Ejercicio 3: Creating Image Streams
	  - Start: -
  	Punto 2.1: Saltar punto 2.1, no es necesario
	Punto 2.2: en lugar de "registry.ocp4.example.com:8443/redhattraining/hello-world-nginx" usar
			"quay.io/redhattraining/hello-world-nginx"

	  - Finish: 
		oc delete project images-streams-app
		oc delete project images-streams-common

	* Lab: Building and Publishing Container Images
	  - Start:
		oc new-project images-review
	Punto 1.3: hacer login en "quay.io" en lugar de en "registry.ocp4.example.com:8443"
	Punto 1.4, 2.1, 4.1: en lugar de "registry.ocp4.example.com:8443/developer/custom-server:1.0.0" usar
			"quay.io/<USUARIO>/custom-server:1.0.0"
	Punto 3.3: usar "quay.io" en lugar de "registry.ocp4.example.com:8443" y las credenciales del usuario en Quay.

	  - Finish:
		oc delete project images-review
		skopeo delete docker://quay.io/<USUARIO>/custom-server:1.0.0
		podman rmi quay.io/<USUARIO>/custom-server:1.0.0

-------
Tema 4
-------
	* Ejercicio 1: Managing Application Builds
	  - Start:
		oc new-project builds-applications

	Punto 3.1 y 4.2: cambiar "https://git.ocp4.example.com/developer/DO288-apps" por 
			          "https://github.com/<USER>/DO288-apps
	Punto 5.3: usar las credenciales del usuario en GitHub.
	
	  - Finish: 
		oc delete project builds-applications

	* Ejercicio 2: Triggering Builds
	  - Start:
		oc new-project builds-triggers

	Punto 2.1: cambiar "registry.ocp4.example.com:8443/redhattraining/ocpdev-builds-triggers-hello:latest" por
			   "quay.io/redhattraining/ocpdev-builds-triggers-hello:latest"
	Punto 4.1: cambiar "oc tag registry.ocp4.example.com:8443/redhattraining/ocpdev-builds-triggers-hello:v2 hello:latest" por 
		oc tag quay.io/redhattraining/ocpdev-builds-triggers-hello:v2 hello:latest"

	  - Finish: 
		oc delete project builds-triggers

	* Ejercicio 3: Customizing an Existing S2I Base Image
	  - Start:
		oc new-project builds-s2i

	Punto 1.1: Saltar, no es necesario
	Punto 1.2: cambiar "registry.ocp4.example.com:8443/ubi9/httpd-24" por "registry.access.redhat.com/ubi9/httpd-24"

	Punto 3.3: en lugar de "registry.ocp4.example.com:8443/ubi9/httpd-24~https://git.ocp4.example.com/developer/DO288-apps" usar 
		   "registry.access.redhat.com/ubi9/httpd-24~https://github.com/<USER>/DO288-apps"

		La construcción va a fallar, se soluciona con lo siguiente.

	Punto Extra: Crear un secret con las credenciales del GitHub del alumno y hacer que el BC use el secret con las credenciales de GitHub para que 
		pueda hacer el fetch del código fuente:

		oc create secret generic git-secret --from-literal=username=<user_GIT> --from-literal=password=<TOKEN_GIT> --type=kubernetes.io/basic-auth
		oc set build-secret --source bc/bonjour git-secret
		oc start-build bonjour		-> Ahora ya funciona la construcción, seguir con el ejercicio

	  - Finish: 
		oc delete project builds-s2i
		podman rmi registry.ocp4.example.com:8443/ubi9/httpd-24

	* Lab: Managing Red Hat OpenShift Builds
	  - Start:
		oc new-project builds-review
	Punto 2.3: en lugar de "https://git.ocp4.example.com/developer/DO288-apps" usar "https://github/<USER>/DO288-apps"

	La construcción falla, se soluciona con lo siguiente
	Punto Extra: Crear un secret con las credenciales del GitHub del alumno y hacer que el BC use el secret con las credenciales de GitHub para que 
		pueda hacer el fetch del código fuente:

		oc create secret generic git-secret --from-literal=username=<user_GIT> --from-literal=password=<TOKEN_GIT> --type=kubernetes.io/basic-auth
		oc set build-secret --source bc/expense-service git-secret
		oc start-build expense-service		-> Ahora ya funciona la construcción, seguir con el ejercicio
	
	Punto 3.6: Usar GitHub y las credenciales del alumno.

	  - Finish: 
		oc delete project builds-review
-------
Tema 5
-------
	* Ejercicio 1: Selecting the Appropriate Deployment Strategy
	  - Start:
		oc new-project deployments-strategy

	Punto 2.1: en lugar de "https://git.ocp4.example.com/developer/DO288-apps" usar "https://git.ocp4.example.com/<USER>/DO288-apps"
	Punto 2.2: falla la construcción, se soluciona con lo siguiente.
	Punto Extra:
		oc create secret generic git-secret --from-literal=username=<user_GIT> --from-literal=password=<TOKEN_GIT> --type=kubernetes.io/basic-auth
		oc set build-secret --source bc/users-db git-secret
		oc start-build users-db		-> Ahora ya funciona la construcción, seguir con el ejercicio
	
	  - Finish: 
		oc delete project deployments-strategy

	* Ejercicio 2: Managing Application Deployments
	  - Start:
		oc new-project deployments-applications

	Punto 3.1: en lugar de "registry.ocp4.example.com:8443/redhattraining/ocpdev-expense-service:4.12" usar "quay.io/redhattraining/ocpdev-expense-service:4.12"

	  - Finish: 
		oc delete project deployments-applications

	* Ejercicio 3: Deploying Stateful Applications
	  - Start:
		oc new-app deployments-stateful
		oc create -f /tmp/DO288-apps/kubefiles/deployments-stateful/mysql-deployment.yaml

	  - Finish: 
		oc delete project deployments-stateful

	* Ejercicio 4: Monitoring Application Health
	  - Start:
		oc new-project deployments-health
		oc create -f /tmp/DO288-apps/kubefiles/deployments-health/project-dimensioning.yaml  

	  - Finish: 
		oc delete project deployments-health

	* Lab: Managing Red Hat OpenShift Deployments
	  - Start:
		oc new-project deployments-review
		oc new-app --template postgresql-ephemeral -p POSTGRESQL_PASSWORD=VsY8M3dXHPKRJqby -p POSTGRESQL_USER=userJPI

	Punto 4.1: en lugar de "registry.ocp4.example.com:8443/redhattraining/ocpdev-deployments-review:4.12" usar "quay.io/redhattraining/ocpdev-deployments-review:4.12"

	  - Finish:
 		oc delete project deployments-review

-------
Tema 6
-------
	* Ejercicio 1: Install Applications by Using Helm Charts
	  - Start:
		oc new-project multicontainer-helm

	Punto 2.2: en lugar de "registry.ocp4.example.com:8443/redhattraining/ocpdev-expense-service:4.12" usar 
			"quay.io/redhattraining/ocpdev-expense-service:4.12"

	  - Finish: 
		oc delete project multicontainer-helm

	* Ejercicio 2: The Kustomize CLI
	  - Start:
		oc new-project multicontainer-kustomize
	
	 en el fichero deployment.yaml en lugar de 
		"registry.ocp4.example.com:8443/redhattraining/famous-quotes:2.1" se está usando "quay.io/redhattraining/famous-quotes:2.1"
		"registry.ocp4.example.com:8443/bitnami/mariadb:10.5.10-debian-10-r0" se está usando "docker.io/bitnami/mariadb:10.5.10-debian-10-r0"

	  - Finish: 
		oc delete project multicontainer-kustomize

	* Lab:
	  - Start:
		oc new-project multicontainer-review

	En lugar de "registry.ocp4.example.com:8443/redhattraining/ocpdev-redis-quotes:4.12" se está usando en el fichero deployment.yaml
			"quay.io/redhattraining/ocpdev-redis-quotes:4.12"

	  - Finish:
		oc delete project multicontainer-review

-------
Tema 7
-------
	* Ejercicio 1: Creating CI/CD Workflows by Using Red Hat OpenShift Pipelines
	  - Start:
		oc new-project pipelines-creation
	Saltar punto 1, se va a usar https://registry.access.redhat.com/ubi8/nodejs-16

	En fichero /tmp/DO288-apps/labs/pipelines-creation/pipeline.yaml, línea 14:
		cambiar: default: "https://git.ocp4.example.com/developer/DO288-apps"
		por: default: "https://github.com/<USER>/DO288-apps"

	Punto 2.6 y punto 6.4, cambiar "value: registry.ocp4.example.com:8443/developer/$(params.IMAGE_NAME):latest"  por
			"value: quay.io/<USER>/$(params.IMAGE_NAME):latest"

  NOTA: Posible problema con credenciales del registry !!!

	  - Finish: 
		oc delete project pipelines-creation

	* Lab: Continuous Deployment by Using Red Hat OpenShift Pipelines
  	  - Start:
		oc new-project pipelines-review
	
	Cambiar fichero /tmp/DO288-apps/kubefiles/pipelines-review/graderun.yaml, línea 12:
		donde pone "value: 'https://git.ocp4.example.com/developer/DO288-apps'"
		poner:  "value: 'https://github.com/<USER>/DO288-apps'"

		oc create -f /tmp/DO288-apps/kubefiles/pipelines-review/clustertask.yaml
		oc create -f /tmp/DO288-apps/kubefiles/pipelines-review/graderun.yaml

	Cambiar fichero /tmp/DO288-apps/labs/pipelines-review/pipeline.yaml, línea 12:
		cambiar "default: "https://git.ocp4.example.com/developer/DO288-apps" "
		por :"default: "https://github.com/<USER>/DO288-apps" "

	Cambiar fichero /tmp/DO288-apps/labs/pipelines-review/run.yaml, línea 12:
		cambiar: value: 'https://git.ocp4.example.com/developer/DO288-apps'
		por: value: 'https://github.com/<USER>/DO288-apps'
 
  	Saltar punto 2
	Punto 4.1, en lugar de "registry.ocp4.example.com:8443/ubi8/openjdk-11:1.16-3"  usar
				"registry.access.redhat.com/ubi8/openjdk-11:1.16-3"
	Punto 6.2, en lugar de "docker://registry.ocp4.example.com:8443/developer/$(params.DEPLOY_APP_NAME)"
				usar "docker://quay.io/<USER>/$(params.DEPLOY_APP_NAME)"
		y en lugar de "value: registry.ocp4.example.com:8443/ubi9/skopeo:9.2"   usar
				"value: registry.access.redhat.com/ubi9/skopeo:9.2"

  NOTA: Posible problema con credenciales del registry !!!	
	  - Finish: 
		oc delete project pipelines-review

-------
Tema 8
-------
	* Lab 1: Building and Deploying a Full-stack Cloud-native Application
	  - Start:
		oc new-project compreview-todo

	IC: en lugar de "registry.ocp4.example.com:8443/redhattraining/todo-backend" usar
			"quay.io/redhattraining/todo-backend"

	Punto 3.3, hacer podman login -u <USER> -p <PASSWORD> quay.io
	Punto 3.4, hacer podman build . -t quay.io/<USER>/todo-frontend:latest
	Punto 3.5, hacer podman push quay/<USER>/todo-frontend   y hacer pública la IC en el Quay del alumno
	Punto 4.1: hacer oc new-app https://github.com/<USER>/DO288-apps .... y no usar nexus o usar el nexus del entorno

	  - Finish: 
		oc delete project compreview-todo

	* Lab 2: Implementing Continuous Integration and Deployment with OpenShift Pipelines
	  - Start:
		oc new-project compreview-cicd
	Saltar punto 1, se va a usar https://registry.access.redhat.com/ubi8/nodejs-16

	En fichero /tmp/DO288-apps/labs/compreview-cicd/pipeline.yaml, línea 18:
		cambiar "default: "https://git.ocp4.example.com/developer/DO288-apps"  por 
		por "default: "https://github.com/<USER>/DO288-apps"	

	  - Finish: 
		oc delete project compreview-cicd


