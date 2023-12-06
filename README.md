# BASH 2.0

Changelog:
  - console commands do not have permissions required, will make this configurable later
  - remove null logging in general/related cvars
  - rewrite bash-discord to use discord-api (did not remake the embeds, no one cares)
  - remove cvar for query timing, set it to 1 second
  - remove gain log not printing when they were heavily turnbinded
  - added style in gain logs
  - set too many -1s ban to 50 in a row, in order to not stop people from being banned before they hit some stupid low dev (going to refactor this later to just delay the ban and reduce the number)
  - fix random errors

## Commands

```
bash2_stats - Show strafe stats
bash2_admin - toggle admin mode, lets you enable/disable printing of bash logs into the chat.
bash2_test  - trigger a test message so you can know if webhooks are working :)
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
```

## Depencenies (for bash discord)

* [smjannson](https://github.com/davenonymous/SMJansson/tree/master/bin)
* [discord api](https://forums.alliedmods.net/showthread.php?t=292448)
* [steamworks] (https://github.com/KyleSanderson/SteamWorks)

## Anticheat bypass

If you are using bhoptimer, you can add "bash_bypass" to a styles special string to disable detection for this style.
