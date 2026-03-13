FROM node:18-alpine

WORKDIR /app

COPY TODO/todo_backend/package*.json ./

RUN npm install

COPY TODO/todo_backend .

ENV PORT=5000

EXPOSE 5000

CMD ["node", "server.js"]