FROM node:alpine 
WORKDIR /app 
COPY . /app/    
EXPOSE 8081 
CMD ["node", "app.js"] 
