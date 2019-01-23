# STEP 1 build static website
FROM node:alpine as builder
RUN apk update && apk add --no-cache make git
# Create app directory
WORKDIR /app
# Install app dependencies
COPY package.json package.json
#RUN cd /app && npm set progress=false && npm install
# Copy project files into the docker image
COPY .  /app
RUN npm install
RUN npm install -g @angular/cli@1.7.4
RUN ng build

# STEP 2 build a small nginx image with static website

FROM nginx:alpine

## Remove default nginx website

RUN rm -rf /usr/share/nginx/html/*

## From 'builder' copy website to default nginx public folder
COPY --from=builder /app/dist /usr/share/nginx/html
#EXPOSE 4200
CMD ["nginx", "-g", "daemon off;"]