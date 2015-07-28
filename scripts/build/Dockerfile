#FROM node 
FROM registry-ice.ng.bluemix.net/ibmnode:latest

RUN mkdir /hellonode

# Move the package.json and npm.install into a seperate
# layer to optimize the build process.
ADD dist/package.json /hellonode/package.json
RUN cd /hellonode && npm install -d --production

COPY dist /hellonode/
COPY interconnect/index.js /hellonode/node_modules/kraken-js/node_modules/express-session/

EXPOSE 80
CMD ["node", "/hellonode/server.js"]
