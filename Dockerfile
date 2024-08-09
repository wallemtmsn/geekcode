# Use uma imagem base apropriada
FROM python:3.9-slim

# Defina o diretório de trabalho
WORKDIR /app

# Defina variáveis de ambiente no formato correto
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Copie os arquivos de requisitos
COPY requirements.txt .

# Crie um ambiente virtual e instale as dependências
RUN python -m venv $VIRTUAL_ENV && \
	. $VIRTUAL_ENV/bin/activate && \
	pip install --upgrade pip && \
	pip install -r requirements.txt

# Copie o restante do código da aplicação
COPY . .

# Comando para iniciar a aplicação
CMD ["python", "run.py"]