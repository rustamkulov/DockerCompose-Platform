FROM mcr.microsoft.com/dotnet/sdk:7.0-alpine AS build
WORKDIR /src

COPY ./src ./
WORKDIR /src/DockerCompose.WebApi

RUN dotnet restore
RUN dotnet publish -c Release -o output

FROM mcr.microsoft.com/dotnet/aspnet:7.0-alpine AS serve
WORKDIR /app
COPY --from=build /src/DockerCompose.WebApi/output .

EXPOSE 80
EXPOSE 443

ENTRYPOINT [ "dotnet", "DockerCompose.WebApi.dll" ]