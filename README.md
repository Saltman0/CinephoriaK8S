# Cinéphoria K8S (Kubernetes)
___

Ce projet est destiné à la création et l'orchestration des différents microservices du projet Cinéphoria.

### Documentation

- [Documentation technique.pdf](https://github.com/user-attachments/files/25327038/Documentation.technique.pdf)
- [Documentation de gestion de projet.pdf](https://github.com/user-attachments/files/25327035/Documentation.de.gestion.de.projet.pdf)
- [Manuel d'utilisation.pdf](https://github.com/user-attachments/files/25327039/Manuel.d.utilisation.pdf)
- [Charte graphique.pdf](https://github.com/user-attachments/files/25327027/Charte.graphique.pdf)

### Pré-requis

* **Linux**
* **[Docker](https://www.docker.com/) et [Docker compose](https://docs.docker.com/compose/)**
* **[Kind](https://kind.sigs.k8s.io/)**
* **[Cloud-provider-kind](https://github.com/kubernetes-sigs/cloud-provider-kind)**
* **[Tilt](https://tilt.dev/)**
* **[Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/)**
* **[Helm](https://helm.sh/)**
* **[Doppler](https://www.doppler.com/)**
* **Les différents microservices de l'application dans le même dossier que** `CinephoriaK8S`:
   * [CinephoriaBookingService](https://github.com/Saltman0/CinephoriaBookingService)
   * [cinephoria-dashboard-service](https://github.com/Saltman0/cinephoria-dashboard-service)
   * [CinephoriaGraphQL](https://github.com/Saltman0/CinephoriaGraphQL)
   * [CinephoriaInfrastructureService](https://github.com/Saltman0/CinephoriaInfrastructureService)
   * [CinephoriaMovieService](https://github.com/Saltman0/CinephoriaMovieService)
   * [CinephoriaShowtimeService](https://github.com/Saltman0/CinephoriaShowtimeService)
   * [CinephoriaUserService](https://github.com/Saltman0/CinephoriaUserService)

### Databases (Cloud)

Vous aurez besoin d'une base de données pour chaque microservice, ce qui en fait un total de **5**.

Voici une liste non-exhaustive des sites Web qui proposent gratuitement une base de données PostgreSQL :

- [Supabase](https://supabase.com/)
- [Neon](https://neon.com/)
- [Google Cloud](https://cloud.google.com/)

### Doppler

Vous aurez besoin d'un compte Doppler pour envoyer les différentes variables d'environnement pour chaque 
microservice de votre cluster Kubernetes.

Voici la liste des différentes configurations à générer (:warning: il est important de respecter impérativement 
le nommage des projets suivants, sinon le cluster ne pourra pas envoyer correctement les secrets provenant de Doppler) :

* cinephoria-booking-service
* cinephoria-dashboard-service
* cinephoria-graphql
* cinephoria-infrastructure-service
* cinephoria-movie-service
* cinephoria-showtime-service
* cinephoria-user-service

Pour chaque configuration Doppler `cinephoria-xxxxx-service`, voici un exemple de des secrets à générer dans votre 
configuration Doppler :
```json
{
  "IS_SSL_ENABLED":"false",
  "IS_VERBOSE_ENABLED":"true",
  "JWT_KEY":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9",
  "JWT_SECRET":"b3d5b5a25a9c494c8f2e4bc799eda0b5f1c3d5a19e564f078dbb729e6ad79f36",
  "NODE_ENV":"development",
  "PORT":"3001",
  "POSTGRES_DB":"postgres",
  "POSTGRES_HOST":"aws-0-us-east-1.pooler.supabase.com",
  "POSTGRES_HOST_AUTH_METHOD":"scram-sha-256",
  "POSTGRES_INITDB_ARGS":"--auth=scram-sha-256",
  "POSTGRES_PASSWORD":"0123456789",
  "POSTGRES_PORT":"6543",
  "POSTGRES_URL":"postgresql://user:0123456789@aws-0-us-east-1.pooler.supabase.com:6543/postgres",
  "POSTGRES_USER":"user"
}
```

### Opérateurs

Lancez la commande `Install_operators.sh` pour installer les différents opérateurs (Doppler, Kong, etc...).

### Déploiement en local

Il ne reste plus que quelques étapes pour le déploiement des différents microservices en local.

Tout d'abord, lancez la commande `Create_kind_cluster.sh` pour générer le cluster Kubernetes.

Ensuite, lancez la commande `cloud-provider-kind` pour mettre en place le Gateway API de Kong.

Pour finir, lancez la commande `tilt up` : cela va enclencher automatiquement les différents microservices

___

> Félicitations ! Le cluster Kubernetes est désormais disponible en local avec tous les microservices dont l'accès 
principal passe par l'adresse IP de la Gateway disponible dans le service `kong-gateway-proxy`.
