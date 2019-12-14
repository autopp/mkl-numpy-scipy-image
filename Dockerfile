FROM python:3.8.0

WORKDIR /app
ADD mkl.conf /etc/ld.so.conf.d/
ADD pip.conf /root/.config/pip/
ADD .numpy-site.cfg /root/
ADD Pipfile Pipfile.lock ./
RUN wget -O /tmp/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB &&\
apt-key add /tmp/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB &&\
rm /tmp/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB &&\
echo deb https://apt.repos.intel.com/mkl all main > /etc/apt/sources.list.d/intel-mkl.list &&\
apt-get update
RUN apt-get -y install intel-mkl-2019.5-075
RUN apt-get -y install gfortran libgfortran-8-dev
RUN apt-get -y install liblapack-dev
RUN pip install pipenv && CFLAGS="--std=c99" pipenv sync
