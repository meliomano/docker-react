# Build Phase

FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build
#CMD ["npm", "run", "build"]

# Run Phase
FROM nginx:alpine
EXPOSE 80
COPY --from=builder  /app/build /usr/share/nginx/html

