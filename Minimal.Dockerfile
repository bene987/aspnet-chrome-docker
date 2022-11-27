FROM amd64/buildpack-deps:jammy-curl AS installer
RUN mkdir -p /Download \
    && curl -fSL --output /Download/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

FROM mcr.microsoft.com/dotnet/aspnet:7.0-jammy AS base
RUN --mount=type=bind,from=installer,source=/Download,target=/Download \
    apt-get update && \
    apt-get install -yq --no-install-recommends /Download/google-chrome-stable_current_amd64.deb && \
    rm -rf /var/lib/apt/lists/*
