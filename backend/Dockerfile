FROM python:3.7.3
EXPOSE 5000
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN chmod -R 644 ./
CMD [ "python", "./app.py" ]