FROM python:3

RUN pip install django
RUN pip install djoser

COPY . .

RUN python manage.py migrate

CMD ["python","manage.py","runserver","0.0.0.0:8000"]

