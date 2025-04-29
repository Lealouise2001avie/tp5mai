# Utiliser l'image officielle Node.js comme base
FROM node:18

# Créer le répertoire de travail dans le conteneur
WORKDIR C:/Users/lelef/tp5mai

# Copier les fichiers package.json et package-lock.json
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier le reste des fichiers de votre application
COPY . .

# Construire l'application
RUN npm run build

# Exposer le port utilisé par votre application
EXPOSE 5000

# Commande pour démarrer l'application
CMD ["npm", "start"]
