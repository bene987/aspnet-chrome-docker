FROM mcr.microsoft.com/dotnet/aspnet:7.0-jammy AS base
RUN apt-get update
RUN apt-get -yq install wget
RUN wget -nv https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -yq --no-install-recommends ./google-chrome-stable_current_amd64.deb
RUN rm google-chrome-stable_current_amd64.deb 
RUN rm -rf /var/lib/apt/lists/*
