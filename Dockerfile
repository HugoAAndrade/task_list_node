# Use a imagem base oficial do Node.js
FROM node:20.10.0

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo package.json e yarn.lock para o diretório de trabalho
COPY package.json yarn.lock ./

# Instale as dependências do projeto
RUN yarn install

# Copie todos os arquivos do projeto para o diretório de trabalho
COPY . .

# Reinstale todas as dependências para garantir a recompilação de módulos nativos
RUN yarn install --force

# Exponha a porta que a aplicação irá rodar (substitua 3333 pela porta que seu app utiliza)
EXPOSE 3333

# Comando para rodar a aplicação e as migrações
CMD ["sh", "-c", "yarn migrate && yarn start"]

