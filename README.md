# BASH 2.0

Note:
My version of bash is more geared toward collecting extra information and making things more presentable for the competitive strafing community. This version of bash does not have any new or advanced detection methods or anything of that nature. If you want to ban users using null movement scripts, this version simply will not do it.

Main Changes:
* Remove useless code that was intended for the older movement community (nulls detections, faking if a player is on the ground to brick optis, etc)
* Add configurations for dev and identical strafes bans
* Logs are more presentable/searchable

## Commands

```
bash2_stats <name> - Show strafe stats
bash2 - toggle admin mode, lets you enable/disable printing of bash logs into the chat.
bash2_test  - trigger a test message so you can know if webhooks are working
```

## Depencenies for the Discord Messages

* [SteamWorks](https://forums.alliedmods.net/showthread.php?t=229556)
* [sm-json](https://github.com/doug919/smjson) (only for compiling)

## Anticheat bypass

If you are using shavit bhoptimer, you can add "bash_bypass" into a style's special string to disable detection for this style.
