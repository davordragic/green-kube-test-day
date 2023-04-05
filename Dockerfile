FROM python:3.8-slim-buster

# Install system dependecies
RUN apt update && apt install -y \ 
    make

WORKDIR /src

# Copy app
COPY . .

# Install python dependecies
RUN pip install --no-cache-dir -r requirements.txt

# Install app
RUN make build

EXPOSE 5000
CMD [ "python", "index.py"]