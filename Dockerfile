FROM node:18-alpine3.15
RUN mkdir -p /home/app
WORKDIR /home/app
COPY ./package.json .
ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
       then npm install; \
       else npm install --only=production; \
       fi
COPY . .
ENV PORT 4000
EXPOSE $PORT
CMD ["npm","run","dev"]
