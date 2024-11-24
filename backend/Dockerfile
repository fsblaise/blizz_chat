FROM node:20-alpine

LABEL name="blizz-chat-backend" \
      version="1.0" \
      description="Blizz Chat backend"

WORKDIR /app

COPY package*.json ./
RUN npm install --production
COPY . .

RUN npm run build

EXPOSE 3000
CMD ["node", "dist/main.js"]
