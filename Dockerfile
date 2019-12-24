#build phase "as builder" is giving a name for this phase or tagging
FROM node:alpine as builder
WORKDIR '/usr/app/react_client'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm","run","build"]
RUN npm run build

#run phase here we no need to tag the phase if we put
#FROM after one phase means it indicates the above phase has completed
FROM nginx
COPY --from=builder /usr/app/react_client/build /usr/share/nginx/html
