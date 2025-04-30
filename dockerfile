# Utiliser l'image officielle Node.js comme base
FROM node:18

# Créer le répertoire de travail dans le conteneur
WORKDIR /tp5mai

# Copier les fichiers package.json et package-lock.json
COPY package.json  package-lock.json ./

# Installer les dépendances
RUN npm install

# Copier le reste des fichiers de votre application
COPY . .

RUN npm run build

FROM node:18

RUN npm install -g serve

WORKDIR /tp5mai

COPY --from=build /tp5mai/build .

# Exposition du port utilisé par l'application (ex: 3000)
EXPOSE 3000

# Commande de démarrage de l'application
CMD ["serve", "-s", ".", "-l", "3000"]
