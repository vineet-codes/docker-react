FROM node:alpine as builder
WORKDIR  '/app'
COPY package.json ./
RUN npm install 
COPY ./ ./
CMD ["npm", "run", "build"]

# final image 
FROM nginx
# just for u and i and aws beanstalk, docker does nothing with  EXPOSE command 
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

