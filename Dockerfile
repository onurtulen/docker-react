FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# GH Tok
# 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