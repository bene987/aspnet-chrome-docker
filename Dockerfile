FROM mcr.microsoft.com/dotnet/aspnet:6.0-focal AS base
RUN apt-get update
RUN apt-get -yq install curl
RUN curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -yq ./google-chrome-stable_current_amd64.deb
RUN rm google-chrome-stable_current_amd64.deb 
RUN rm -rf /var/lib/apt/lists/*
