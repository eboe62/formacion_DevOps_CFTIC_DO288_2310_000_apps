FROM registry.access.redhat.com/ubi8/python-39:latest

COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py app.py

EXPOSE 8080

CMD ["gunicorn", "app", "--bind", ":8080"]
