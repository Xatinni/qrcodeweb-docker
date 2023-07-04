# Pull base image
FROM python:3.12-rc-alpine

WORKDIR /usr/src/app

# Install build dependencies
RUN apk add --virtual build-deps gcc musl-dev
RUN apk add --no-cache git zlib-dev jpeg-dev 

# Clone qrcodeweb repository
RUN git clone https://github.com/Xatinni/qrcodeWeb.git
RUN cd /usr/src/app/qrcodeWeb

# Install Python requirements - Flask, qrcode, Pillow
RUN pip install --no-cache-dir -r ./qrcodeWeb/requirements.txt

# Remove build dependencies
RUN apk del build-deps git gcc musl-dev zlib-dev musl-dev

CMD [ "python", "./qrcodeWeb/form.py" ]