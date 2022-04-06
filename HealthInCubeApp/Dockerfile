FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 5000

ENV ASPNETCORE_URLS=http://+:5000

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["./EmailService/EmailService.csproj", "./EmailService/"]
COPY ["./HealthInCube_BackEnd/HealthInCube_BackEnd.csproj", "./HealthInCube_BackEnd/"]
RUN dotnet restore "./HealthInCube_BackEnd/HealthInCube_BackEnd.csproj"
COPY . .
WORKDIR "/src/HealthInCube_BackEnd"
RUN dotnet build "HealthInCube_BackEnd.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "HealthInCube_BackEnd.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "HealthInCube_BackEnd.dll"]
