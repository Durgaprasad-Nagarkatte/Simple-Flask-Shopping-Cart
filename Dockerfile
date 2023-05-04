FROM python:3.8-alpine
# install the dependencies and packages in the requirements file
RUN pip install Flask==2.0.2
RUN pip install itsdangerous==2.0.1
RUN pip install MarkupSafe==2.0.1
RUN pip install Werkzeug==2.0.2

COPY . .
# configure the container to run in an executed manner]
EXPOSE 5000
CMD ["python","main.py", "0:5000"]
