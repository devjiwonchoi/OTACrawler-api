FROM node:18-alpine

RUN apk add --no-cache \
  chromium \
  nss \
  freetype \
  harfbuzz \
  ca-certificates \
  ttf-freefont

ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

WORKDIR /
COPY package*.json ./
RUN yarn
COPY . .
RUN yarn build

EXPOSE 8000

CMD [ "yarn", "start" ]