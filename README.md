# Blizz Chat
This is a simple instant messenger/social media app with a minimalist design (material you), with authentication, where registered users can find themselves friends, chat with them, create stories and find each other on the map. Every message is end-to-end encrypted and there is no persistent storage* of messages on the backend api.

## Technical details
**Mobile app:**
- Flutter framework (Dart)
- Libsignal protocol for end-to-end encryption
- Bloc state management

**Api:**
- NestJs framework (TypeScript)
- MongoDb with Mongoose
- Future: Firebase Cloud Messaging (push notifications)

## Installation

### Docker

1. Pull the images
```
docker pull mongo:latest
docker pull fsblaise/blizz-chat-backend:latest
```
2. Create docker network locally
```
docker network create ${NETWORK_NAME}
```
3. Run mongodb container
```
docker run -d --name ${MONGODB_CONTAINER_NAME} --network ${NETWORK_NAME} -e MONGO_INITDB_ROOT_USERNAME=${username} -e MONGO_INITDB_ROOT_PASSWORD=${password} -p 27017:27017 -v ./mongo-data:/data/db mongo:latest
```
4. Run backend container
```
docker run -d --name ${BACKEND_CONTAINER_NAME} -p 3000:3000 --network ${NETWORK_NAME} -e DB_URI=mongodb://${username}:${password}@${MONGODB_CONTAINER_NAME}:27017 -e JWT_SECRET=${CUSTOM_SECRET} fsblaise/blizz-chat-backend:latest
```

*Backend url: http://localhost:3000* <br>
*Db url: mongodb://${username}:${password}@localhost:27017*

### Source code build

**Api** (requires nodejs 20):
```
cd backend
docker compose up
npm i
npm run start
```

**Frontend** (requires nodejs 20):
```
cd frontend
npm i
npm run start
```

**Mobile app** (requires flutter version 3.22.2)
```
cd mobile_new
flutter pub add
flutter run
```

*Persistent storage: Messages are only cached in a queue, if the websocket connection is not live with the recipient of the message. As soon as the recipient is connected via websocket, every message is being sent.
