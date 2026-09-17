Cfg = {}

--- ### TEBEX - MUSIC - PlayTube  ### ---
Cfg.TebexTransactionID = "tbx-82211922a86150-8ad8ab" --- Required for PlayTube and Music app. (Example : tbx-....)

-- Discord Webhook - start --

Cfg.MessagesWebhook = true
Cfg.CallWebhooks    = true


--## To use the media service of gkshop => GKSMedia (https://service.gkshop.org/package/5563991)
Cfg.MediaServices   = "discord" --- ## gkshop(picture,audio,video), discord(picture,audio,video), imgur(only picture), imgbb(only picture)
Cfg.MediaToken      = ""        --- ## Media Service Token (if you are using discord leave this blank)

Cfg.VoiceMail       = "https://discord.com/api/webhooks/1272428357811703848/axjHLIEf3iFROkkLQ6i6_W-8Nc9WsmmlBFDV6vYyIkZPWOrxuMI0rFcIdzDx3pR5IaeP"--
Cfg.PhotoWebHook    = "https://discord.com/api/webhooks/1265153565006102621/rtOxc69j2_z-DelF6nI8zvOOSPdHb0OpvWnJmUBi13VCL9DedDfGP7-xVUmSU1RUaC28"--phone hook
Cfg.Carseller       = "https://discord.com/api/webhooks/1272429558951448658/MsrDRPyB6esZjqeTiLTBrAKUPsEaskp2KkxGdu1vQ2fqQfQ01Xn5XqSTnrcNBpKzPvt_"--carhook
Cfg.NewCarSeller    = "https://discord.com/api/webhooks/1272429558951448658/MsrDRPyB6esZjqeTiLTBrAKUPsEaskp2KkxGdu1vQ2fqQfQ01Xn5XqSTnrcNBpKzPvt_"--carhook
Cfg.JobNotif        = "https://discord.com/api/webhooks/1272430272159420486/J7VyRWsmjSI4IoC6zsEApDlFOT6CGgoU-rP0kGnvxNsNaxf5gfKMdujaO1P5lqnT6KC2"--job hook
Cfg.TwitterWeb      = "https://discord.com/api/webhooks/1272429362897227857/4ux9pbelp3XQbVgB9oRslDfyL8sW1Z0y2-muXR8U8Z36XMkrjSzXhfqlwZh04dp84SaB"--twitter
Cfg.YellowWeb       = "https://discord.com/api/webhooks/1272429999093186591/-YzSKxQbj8e6aC_Uh9Oubtgjp4TovJsaHsMvKrScb8oPjq3C7lkcvkihJmD2zOczbbhS"--yellow hook
Cfg.InstagramWeb    = "https://discord.com/api/webhooks/1272429237613363211/YUcpcFcH3poBiUMDS4UOFmdP7l1v3b3s9iC4rZ9lOcrgX_grAnwtPZxnhYTiKcPFNvM3"--insta hook
Cfg.Crypto          = "https://discord.com/api/webhooks/1272428357811703848/axjHLIEf3iFROkkLQ6i6_W-8Nc9WsmmlBFDV6vYyIkZPWOrxuMI0rFcIdzDx3pR5IaeP"--
Cfg.BankTransfer    = "https://discord.com/api/webhooks/1272428357811703848/axjHLIEf3iFROkkLQ6i6_W-8Nc9WsmmlBFDV6vYyIkZPWOrxuMI0rFcIdzDx3pR5IaeP"--
Cfg.RaceWinning     = "https://discord.com/api/webhooks/1265153565006102621/rtOxc69j2_z-DelF6nI8zvOOSPdHb0OpvWnJmUBi13VCL9DedDfGP7-xVUmSU1RUaC28"--phone hook
Cfg.RaceCreate      = "https://discord.com/api/webhooks/1265153565006102621/rtOxc69j2_z-DelF6nI8zvOOSPdHb0OpvWnJmUBi13VCL9DedDfGP7-xVUmSU1RUaC28"--phone hook
Cfg.MessageWeb      = "https://discord.com/api/webhooks/1272428357811703848/axjHLIEf3iFROkkLQ6i6_W-8Nc9WsmmlBFDV6vYyIkZPWOrxuMI0rFcIdzDx3pR5IaeP"--
Cfg.CallWebhook     = "https://discord.com/api/webhooks/1272428357811703848/axjHLIEf3iFROkkLQ6i6_W-8Nc9WsmmlBFDV6vYyIkZPWOrxuMI0rFcIdzDx3pR5IaeP"--
Cfg.JobApplication  = "https://discord.com/api/webhooks/1265153565006102621/rtOxc69j2_z-DelF6nI8zvOOSPdHb0OpvWnJmUBi13VCL9DedDfGP7-xVUmSU1RUaC28"--phone hook
Cfg.NewsWebook      = "https://discord.com/api/webhooks/1272428357811703848/axjHLIEf3iFROkkLQ6i6_W-8Nc9WsmmlBFDV6vYyIkZPWOrxuMI0rFcIdzDx3pR5IaeP"--
Cfg.NewBilling      = "https://discord.com/api/webhooks/1265153565006102621/rtOxc69j2_z-DelF6nI8zvOOSPdHb0OpvWnJmUBi13VCL9DedDfGP7-xVUmSU1RUaC28"--phone hook
Cfg.BankLimit       = 5000 -- # Minimum money transfer for https://discord.com/api/webhooks/1265153565006102621/rtOxc69j2_z-DelF6nI8zvOOSPdHb0OpvWnJmUBi13VCL9DedDfGP7-xVUmSU1RUaC28
Cfg.ExploitWebhook  = "https://discord.com/api/webhooks/1272428357811703848/axjHLIEf3iFROkkLQ6i6_W-8Nc9WsmmlBFDV6vYyIkZPWOrxuMI0rFcIdzDx3pR5IaeP"--
Cfg.LiveDonate      = "https://discord.com/api/webhooks/1265153565006102621/rtOxc69j2_z-DelF6nI8zvOOSPdHb0OpvWnJmUBi13VCL9DedDfGP7-xVUmSU1RUaC28"--phone hook


Cfg.PlayerInfo = true -- (Instagram, Yellow Pages, Twitter)


-- Discord Webhook - end --


