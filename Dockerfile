FROM mcr.microsoft.com/dotnet/runtime:6.0

ARG MCC_VERSION

RUN apt-get update && \ 
    apt-get install -y tmux curl && \
    apt-get clean

RUN mkdir -p /opt/app
WORKDIR /opt/app

RUN curl -L https://github.com/MCCTeam/Minecraft-Console-Client/releases/download/${MCC_VERSION}/MinecraftClient-${MCC_VERSION}-linux-x64 --output client
RUN chmod +x client

ENTRYPOINT ["tmux", "new-session", "./client"]
