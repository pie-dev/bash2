#include <sourcemod>
#include <bash2>
#include <discord>

#pragma semicolon 1

ConVar gCV_Webhook;
ConVar gCV_OnlyBans;

public Plugin myinfo =
{
	name = "[BASH] Discord",
	author = "Eric",
	description = "",
	version = "1.0.0",
	url = "https://github.com/hermansimensen/bash2"
};

public void OnPluginStart()
{
	gCV_Webhook = CreateConVar("bash_discord_webhook", "", "Discord webhook.", FCVAR_PROTECTED);
	gCV_OnlyBans = CreateConVar("bash_discord_only_bans", "0", "Only send ban messages and no logs.", _, true, 0.0, true, 1.0);
	AutoExecConfig(true, "bash-discord", "sourcemod");
}

public void Bash_OnDetection(int client, char[] buffer)
{
	if (gCV_OnlyBans.BoolValue)
	{
		return;
	}
	PrintToDiscord(client, buffer);
}

public void Bash_OnClientBanned(int client)
{
	PrintToDiscord(client, "Banned for cheating.");
}

public void PrintToDiscord(int client, const char[] log, any ...)
{
	char buffer[1024];
	VFormat(buffer, sizeof(buffer), log, 3);

	char webhook[256];
	gCV_Webhook.GetString(webhook, sizeof(webhook));
	DiscordWebHook hook = new DiscordWebHook(webhook);
	
	char HostnameString[64];
	ConVar HostNameConVar = FindConVar("hostname");
	GetConVarString(HostNameConVar, HostnameString, sizeof(HostnameString));
	hook.SetUsername(HostnameString);
	
	char steamId[32];
	GetClientAuthId(client, AuthId_SteamID64, steamId, sizeof(steamId));

	char name[MAX_NAME_LENGTH];
	GetClientName(client, name, sizeof(name));
	SanitizeName(name);

	char content[1024];
	Format(content, sizeof(content), "[%s](<https://www.steamcommunity.com/profiles/%s>) %s", name, steamId, buffer);

	hook.SetContent(content);
	hook.Send();
	delete hook;
}

void SanitizeName(char[] name)
{
	ReplaceString(name, MAX_NAME_LENGTH, "(", "", false);
	ReplaceString(name, MAX_NAME_LENGTH, ")", "", false);
	ReplaceString(name, MAX_NAME_LENGTH, "]", "", false);
	ReplaceString(name, MAX_NAME_LENGTH, "[", "", false);
}
