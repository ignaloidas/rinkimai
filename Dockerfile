FROM python:3.6-alpine

# for cloudflare-bypass
RUN apk add nodejs-current

RUN python3 -m pip install pipenv

WORKDIR /app
ADD . /app

RUN pipenv install --ignore-pipfile

CMD ["pipenv", "run", "flask", "run", "--port", "3000", "--no-debugger", "--no-reload", "--host", "0.0.0.0"]

EXPOSE 3000

ENV REDIS_HOST='redis'
ENV REDIS_PORT=6379

LABEL Name=rinkimai Version=0.0.1