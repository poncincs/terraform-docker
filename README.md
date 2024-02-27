# Terraform Docker Web Containers

Ce projet utilise Terraform pour créer des conteneurs web Docker en configurant diverses options telles que l'image Docker, la mémoire, les privilèges, les ports internes et externes, ainsi que les noms des conteneurs. Chaque conteneur dispose également de son propre volume monté pour différencier les fichiers web.

## Structure des fichiers

```
.
├── README.md
├── main.tf
├── LICENSE
└── modules/
    └── docker-nginx/
        ├── variables.tf
        ├── main.tf
        └── outputs.tf
```

## Configuration

Le fichier `main.tf` contient la configuration principale. Vous pouvez personnaliser les paramètres en ajustant les variables dans ce fichier.

### Variables

| Variable              | Description                                                                        | Type          | Valeur par défaut                    |
|-----------------------|------------------------------------------------------------------------------------|---------------|--------------------------------------|
| `container_name`      | Nom du conteneur.                                                                  | String        | "web-app"                            |
| `container_image`     | Image du conteneur.                                                                | String        | "nginx"                              |
| `container_volume`    | Volume pour le conteneur.                                                          | String        | "web_data"                           |
| `container_memory`    | Mémoire allouée pour le conteneur.                                                 | Number        | 256                                  |
| `container_privileged`| Indique si le conteneur doit être privilégié ou non.                               | Bool          | true                                 |
| `containers_number`   | Nombre de conteneurs à générer.                                                    | Number        | 1                                    |
| `int_port`            | Port interne pour le conteneur.                                                    | Number        | 80                                   |
| `ext_port`            | Port externe à utiliser comme point de départ pour les conteneurs.                 | Number        | 3000                                 |
| `healthcheck_command` | Commande de vérification de l'état de santé.                                       | List(String)  | ["CMD", "curl", "-f", "localhost"]  |


## Prérequis

Assurez-vous d'avoir les éléments suivants installés sur votre système :

- [Terraform](https://www.terraform.io/downloads.html)
- [Docker](https://docs.docker.com/get-docker/)

## Utilisation

1. **Clonage du dépôt :**  
   Clonez le dépôt depuis GitHub en utilisant la commande suivante :
   ```
   git clone https://github.com/poncincs/terraform-docker.git
   ```

2. **Accès au répertoire :**  
   Accédez au répertoire du projet cloné :
   ```
   cd terraform-docker
   ```

3. **Initialisation de Terraform :**  
   Exécutez `terraform init` pour initialiser Terraform et télécharger les plugins nécessaires :
   ```
   terraform init
   ```

4. **Validation du plan Terraform :**  
   Exécutez `terraform plan` pour voir les actions que Terraform va entreprendre en fonction de votre configuration. Assurez-vous que tout est correct avant de passer à l'étape suivante :
   ```
   terraform plan
   ```

5. **Création des conteneurs :**  
   Exécutez `terraform apply` pour créer les conteneurs Docker en fonction de votre configuration :
   ```
   terraform apply
   ```

6. **Nettoyage :**  
   Si vous souhaitez supprimer les conteneurs créés, exécutez `terraform destroy` après avoir terminé :
   ```
   terraform destroy
   ```

## Personnalisation

N'hésitez pas à personnaliser ce projet en ajoutant de nouvelles fonctionnalités ou en ajustant les configurations selon vos besoins spécifiques.

## Avertissement

Ce projet crée et gère des ressources Docker sur votre système. Assurez-vous de comprendre les implications avant d'exécuter Terraform.
