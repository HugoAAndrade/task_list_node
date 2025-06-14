# Use a imagem oficial do Node.js
FROM node:20

# Define o diretório de trabalho no container
WORKDIR /app

# Copia os arquivos de configuração primeiro para aproveitar o cache do Docker
COPY package.json yarn.lock ./

# Instala as dependências
RUN yarn install

# Copia o restante do código
COPY . .

# Expõe a porta usada pela aplicação
EXPOSE 3333

# Comando para iniciar a aplicação
CMD ["yarn", "start"]
