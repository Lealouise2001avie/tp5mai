# Stage 1: Build the app
FROM node:18 AS build

WORKDIR /tp5mai

COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN npm run build

# Stage 2: Serve the static build
FROM node:18

RUN npm install -g serve

WORKDIR /tp5mai

COPY --from=build /tp5mai/build .

EXPOSE 3000

CMD ["serve", "-s", ".", "-l", "3000"]
