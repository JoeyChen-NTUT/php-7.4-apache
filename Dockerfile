FROM php:7.3-apache

RUN curl -o /usr/share/ca-certificates/NTUT_CA.pem https://cnc.ntut.edu.tw/var/file/4/1004/img/1183/NTUT_Computer_And_Network_Center_Root_CA.cer
RUN update-ca-certificates --fresh

RUN export DEBIAN_FRONTEND=noninteractive
RUN apt clean
RUN apt update
RUN apt install -y apt-utils git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#enable mods
RUN a2enmod rewrite
