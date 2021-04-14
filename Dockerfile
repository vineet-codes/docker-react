FROM node:alpine as builder
WORKDIR  '/app'
COPY package.json ./
RUN npm install 
COPY ./ ./
CMD ["npm", "run", "build"]

# final image 
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

