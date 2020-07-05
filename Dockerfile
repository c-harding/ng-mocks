FROM satantime/puppeteer-node:10-buster-slim

WORKDIR /app
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["sh", "build-with-supported-angluars.sh"]

VOLUME /npm
VOLUME /app/node_modules
VOLUME /app/e2e/a5es5/node_modules
VOLUME /app/e2e/a5es2015/node_modules
VOLUME /app/e2e/a6es5/node_modules
VOLUME /app/e2e/a6es2015/node_modules
VOLUME /app/e2e/a7es5/node_modules
VOLUME /app/e2e/a7es2015/node_modules
VOLUME /app/e2e/a8es5/node_modules
VOLUME /app/e2e/a8es2015/node_modules
VOLUME /app/e2e/a9es5ivy/node_modules
VOLUME /app/e2e/a9es5noivy/node_modules
VOLUME /app/e2e/a9es2015ivy/node_modules
VOLUME /app/e2e/a9es2015noivy/node_modules
VOLUME /app/e2e/a10es5ivy/node_modules
VOLUME /app/e2e/a10es5noivy/node_modules
VOLUME /app/e2e/a10es2015ivy/node_modules
VOLUME /app/e2e/a10es2015noivy/node_modules

RUN npm config set cache /npm --global

COPY ./docker/ /
COPY ./ /app/
