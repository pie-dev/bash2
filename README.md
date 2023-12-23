# BASH 2.0

### [my discord](https://discord.gg/j9nfnjcUVd)

Changelog:
* Identical strafe auto ban and dev auto ban configurable in config
* Delay too many identical strafe auto ban till after 50 strafes have been collected regardless of auto ban number, to not "save" the player from getting a low dev
* Console commands do not have permissions required, will make this configurable later
* Remove a bunch of useless persistent data, important persistent data still exists
* remove null logging in general/related cvars
* rewrite bash-discord to use discord-api (did not remake the embeds, no one cares)
* remove cvar for query timing, set it to 1 second
* remove gain log not printing when they were heavily turnbinded
* added style in gain logs
* fix random errors

## Commands

```
bash2_stats <name> - Show strafe stats
bash2_admin - toggle admin mode, lets you enable/disable printing of bash logs into the chat.
bash2_test  - trigger a test message so you can know if webhooks are working
```

## ConVars

### shavit-bash.sp

```
bash_banlength - lets you set banlength
bash_autoban - disable/enable automatic banning.
bash_persistent_data - Saves and reload strafe stats on player rejoin.
```

### shavit-bash-discord.sp

```
bash_discord_webhook - The url for the Discord webhook.
bash_discord_only_bans - Only send ban messages and no logs.
bash_discord_use_embeds - Send embed messages.
```

## Depencenies (for bash discord)

* [SteamWorks](https://forums.alliedmods.net/showthread.php?t=229556)
* [sm-json](https://github.com/doug919/smjson) (only for compiling)

## Anticheat bypass

If you are using bhoptimer, you can add "bash_bypass" to a styles special string to disable detection for this style.
