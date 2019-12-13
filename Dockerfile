FROM python:3.8.0

WORKDIR /app
ADD Pipfile Pipfile.lock ./
RUN wget -O /tmp/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB &&\
apt-key add /tmp/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB &&\
rm /tmp/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB &&\
echo deb https://apt.repos.intel.com/mkl all main > /etc/apt/sources.list.d/intel-mkl.list &&\
apt-get update &&\
apt-get -y install intel-mkl-2019.5-075
