Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A4C757F1F
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Jul 2023 16:13:23 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B5EAE43D20
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Jul 2023 14:13:21 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by lists.linaro.org (Postfix) with ESMTPS id C4B613F672
	for <greybus-dev@lists.linaro.org>; Tue, 18 Jul 2023 14:13:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JzNN3Nm2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=puSiuL4M;
	spf=pass (lists.linaro.org: domain of tiwai@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=tiwai@suse.de;
	dmarc=pass (policy=none) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D35362190B;
	Tue, 18 Jul 2023 14:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689689594; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jYz0yKW28gmyrJl6b360seloo2D1rNdugsefOjCWxHs=;
	b=JzNN3Nm2P0wESOvaptWZuuJKIQXgrSBnkDOO9v+xaEV+b4jFeXEZsHCP6NDrAQ0Ka/PGVk
	PBFy9B3RFRS8SiL0jsvBOzzDG5LbsXCeE+0BVzGTG6wFCgqbUDjY/X3w6xVhxLOypSsd2s
	LoP2ZUfv34+OZN72GKW8/Mct58VlC9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689689594;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jYz0yKW28gmyrJl6b360seloo2D1rNdugsefOjCWxHs=;
	b=puSiuL4MJh0OB5f28b9iYQ47y6AOaroe7EZp2zw7VqRHnWC8fEE1W5iquqiC3Lxhd6Dnqf
	szbRoCvNHkjuUOAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 93123134B0;
	Tue, 18 Jul 2023 14:13:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EcgAI/qdtmQ8AQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 14:13:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 18 Jul 2023 16:12:53 +0200
Message-Id: <20230718141304.1032-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C4B613F672
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-0.50)[195.135.220.28:from];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:195.135.220.0/27];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[suse.de,kernel.org,microchip.com,linuxfoundation.org,metafoo.de,animalcreek.com,analog.com,gmail.com,lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[12];
	ASN(0.00)[asn:29298, ipnet:195.135.220.0/23, country:DE];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: TSDC4XIEAX5RWBLIFM4Q6QBR74WKI4QK
X-Message-ID-Hash: TSDC4XIEAX5RWBLIFM4Q6QBR74WKI4QK
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, Alex Elder <elder@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, Johan Hovold <johan@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Mark Brown <broonie@kernel.org>, =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 00/11] ALSA: Make control API taking controls_rwsem consistently
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TSDC4XIEAX5RWBLIFM4Q6QBR74WKI4QK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A few ALSA control API helpers like snd_ctl_rename(), snd_ctl_remove()
and snd_ctl_find_*() suppose the callers taking card->controls_rwsem.
But it's error-prone and fragile.  This patch set tries to change
those API functions to take the card->controls>rwsem internally by
themselves, so that the drivers don't need to take care of lockings.

After applying this patch set, only a couple of places still touch
card->controls_rwsem (which are OK-ish as they need for traversing the
control linked list).


Takashi

===

Takashi Iwai (11):
  ALSA: control: Take card->controls_rwsem in snd_ctl_rename()
  staging: greybus: audio_helper: Use snd_ctl_remove_id()
  ASoC: atmel: mchp-pdmc: Use snd_ctl_remove_id()
  ALSA: control: Take controls_rwsem lock in snd_ctl_remove()
  ALSA: control: Add lockdep warning to internal functions
  ASoC: sigmadsp: Simplify with snd_ctl_activate_id()
  staging: greybus: Avoid abusing controls_rwsem
  ALSA: control: Make snd_ctl_find_id() argument const
  ALSA: control: Introduce unlocked version for snd_ctl_find_*() helpers
  ALSA: control: Take lock in snd_ctl_find_id() and snd_ctl_find_numid()
  ALSA: emu10k1: Go back and simplify with snd_ctl_find_id()

 drivers/staging/greybus/audio_codec.c  |  18 ++--
 drivers/staging/greybus/audio_codec.h  |   1 +
 drivers/staging/greybus/audio_helper.c |  20 +---
 include/sound/control.h                |   6 +-
 sound/core/control.c                   | 126 ++++++++++++++++++++-----
 sound/core/control_compat.c            |   2 +-
 sound/core/control_led.c               |   2 +-
 sound/core/jack.c                      |   2 -
 sound/core/oss/mixer_oss.c             |  10 +-
 sound/core/pcm.c                       |   2 -
 sound/isa/sb/emu8000.c                 |   2 -
 sound/isa/sb/sb16_csp.c                |   2 -
 sound/pci/emu10k1/emufx.c              |   5 -
 sound/pci/hda/hda_codec.c              |   2 -
 sound/soc/atmel/mchp-pdmc.c            |  12 +--
 sound/soc/codecs/sigmadsp.c            |  25 +----
 sound/soc/soc-topology.c               |   3 -
 17 files changed, 129 insertions(+), 111 deletions(-)

-- 
2.35.3

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
