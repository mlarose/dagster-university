FROM python:3.10
# Add any steps to install project system dependencies like java

WORKDIR /opt/dagster/app

COPY . /opt/dagster/app

# Add steps to install the Python dependencies for your Dagster project
# into the default Python on PATH
# For example, this project uses setup.py and we install all dependencies into the Docker container
# using `pip`.
RUN apt-get update &&\
    apt-get install -y binutils libproj-dev libgdal-dev gdal-bin && rm -rf /var/lib/apt/lists/*


RUN pip install --upgrade pip
RUN pip install GDAL==$(gdal-config --version)
RUN pip install -e .
