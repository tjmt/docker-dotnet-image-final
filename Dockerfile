FROM microsoft/dotnet:2.2-aspnetcore-runtime

#---------Argumentos
ARG TimeZone="America/Cuiaba"
ARG Language="pt_BR"
ARG Unicode="UTF-8"

#---------Configura o TimeZone
RUN ln -snf /usr/share/zoneinfo/$TimeZone /etc/localtime \
    && echo $TimeZone > /etc/timezone

#Configurando linguagem
RUN apt-get update
RUN apt-get install -y locales locales-all
RUN locale-gen ${Language}.${Unicode} 
RUN update-locale LANG=${Language}.${Unicode}
ENV LANG ${Language}.${Unicode}
ENV LANGUAGE ${Language}

#Expondo as portas 80 e 443
ONBUILD EXPOSE 80 443