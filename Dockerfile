FROM microsoft/dotnet:2.1-aspnetcore-runtime

#---------Argumentos
ARG TimeZone

#---------Configura o TimeZone
RUN ln -snf /usr/share/zoneinfo/$TimeZone /etc/localtime \
    && echo $TimeZone > /etc/timezone

#Configurando linguagem pt-br
RUN apt-get update
RUN apt-get install -y locales locales-all
RUN locale-gen pt_BR.UTF-8 
RUN update-locale LANG=pt_BR.UTF-8
ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR

#Expondo as portas 80 e 443
EXPOSE 80 443