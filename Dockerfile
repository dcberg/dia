FROM registry.stage1.ng.bluemix.net/ibmnode:latest
#FROM node:latest

# Move the package.json and npm.install into a seperate
# layer to optimize the build process.
ADD dist/package.json /dia/package.json

RUN cd /dia && npm install -d --production

COPY dist /dia/
COPY interconnect/index.js /dia/node_modules/kraken-js/node_modules/express-session/

EXPOSE 80
CMD ["node", "/dia/server.js"]

#ENV VCAP_SERVICES='{"tradeoff_analytics": [{"name": "Tradeoff Analytics-sv","label": "tradeoff_analytics","plan": "standard","credentials": {"url": "https://gateway.watsonplatform.net/tradeoff-analytics/api","username": "601cacb0-162b-41a4-9416-22c89cb8a66a","password": "bcaKUhcTlwLx"}}]}'
