Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F5588182A
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Mar 2024 20:58:05 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4029F40449
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Mar 2024 19:58:04 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78])
	by lists.linaro.org (Postfix) with ESMTPS id AF8313F449
	for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 08:17:17 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=web.de header.s=s29768273 header.b="g/x+FVBm";
	dmarc=pass (policy=quarantine) header.from=web.de;
	spf=pass (lists.linaro.org: domain of Markus.Elfring@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=Markus.Elfring@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1710836202; x=1711441002; i=markus.elfring@web.de;
	bh=uzonqETjBL7wvsx1e0qgd7nuZrbRUOV/H6cEp0IzqiI=;
	h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:
	 In-Reply-To;
	b=g/x+FVBmnu61tRamL12tuhNDgx9SMWTYiZfQkebr6p5v+WBg2maOW+/qaWRrTBWN
	 VB+0loBcCKFAwCqSbczc04X5EwwCxQtAiLuBUpRvxCs7EvSZh7ZAV0GCjh6Iq2muU
	 VQGW4RlC/wcDbhP1jNgFf6F4cLBlC6I4oB+GMS1eTmumBWxawOpWhY76p/X3H+p9m
	 6kXQAsJPix8kmeK0/Rk+wqDHYn3fuwQdyvG4rkHbfrCc9u6g2aAb2xK0Jgsdkg8Gb
	 3pMfRU1b/5vUujSZBIeyzhbBS3lFbf/yZHA+3mWqagbq361zWpCaX7rwsS9oLwfhA
	 vTZ2vRMylGwzZ9SCrQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N62uQ-1qgPOE11Sq-016FmE; Tue, 19
 Mar 2024 09:16:42 +0100
Message-ID: <96d3951d-b349-41b8-aabb-a192ad48998f@web.de>
Date: Tue, 19 Mar 2024 09:16:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ayush Singh <ayushdevel1325@gmail.com>,
 Vaishnav M A <vaishnav@beagleboard.org>, devicetree@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, lorforlinux@beagleboard.org,
 greybus-dev@lists.linaro.org
References: <20240317193714.403132-3-ayushdevel1325@gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240317193714.403132-3-ayushdevel1325@gmail.com>
X-Provags-ID: V03:K1:0IHwukSICsCvj6kPOCM3vt8fzMgYs/nIP5+26Xk+rQXIsUzZooI
 yGP3OV6ldYmxeHm2sAIVkY+9nJvFtrdDZN/XkROgbABzLnr54XgLc6V8sVdES6oSJd7NXAG
 8v0SQgMz+JZkWW1zSywvHayFEufEtYWVzKC/6RuQo8lZpX1h4nZq5bNqOBKaPR4xuGUcQVc
 JH1Xw2XHEk8zmSykpitlg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3RBMOAKdwIU=;MKcjDM5zaXWSHwJ3rfDeQAu0vxs
 QaiauQyp0eKMC+n3+IcKn7LreYpPleAmDqehCAaTqKdQtF5ksxCfKRDkQVDHxmS9U2xwZ9j+A
 VYk8ByHVzuv/CLjL3engeFaYfJUrr298Ji2ZwzOPLLnMlF4Y7evl8uGs0whg4l3hBABcNvPe/
 +u9CvF+oXof3XNRe1JzHrqVr17f29WqX8mUUDQb9Ob1DohNT6gLh5IYZhD+Y9Eif/iVomVD20
 GJ3kGUE8RNvWkVoii18Kqb0uKG1dErlheEMQTf+vpnkLcRB3KuXkYBltR6jbW0cAgNhO7mpSk
 X3m0OIdd8YBS4rAe1yb0q3Et4Thg0iZjU7M3LcAljSRCH4b+SGcZxrszCTyIR4PnZRVpBufHr
 SIrDDqYXPBPrI3Lw2kMKrNMr1Ly0Qf52563Wcy3f7RR0W7OmmS39HltOkccDs4qUDPCyalKiL
 6bBsH3B0kM2SI9oh2OfV92BJMo/cnjFsyY24Zu7eyTpmWYEDil4AjhvYcbW1mVCj2GO3nVevE
 Hi2YWkTvGx15hFAIQ3qckXQBj7r8WRqbpvVKR0td/Dqt80qld30zgr7uzh9cX9z6RUvNyU/qF
 qseg/13A2ZkKbkZW6T2XBKOWHg9OcR1aqcree7uYzxRHkMp69TRYhR6ngsjGpCYOjuiBO2pel
 wP4M8pKXhiX+54UzC+0nNZYoLxOr5o1ssvqZHWSfLZZvnlDiWmfUUIdArn7NCR9JcDiDAGQXH
 ql26ZbKO1o54jNSDGE2uuW0l96zPaXNae118jdOHJarYXbFAzp56boBW7AoFnY/sGn18RyOII
 xY1YLTBy9m92bOsur+wqNP5RgdfshRr8ctYLqdM0d+ALA=
X-Rspamd-Queue-Id: AF8313F449
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.59 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+a:mout.web.de];
	RWL_MAILSPIKE_VERYGOOD(-0.20)[217.72.192.78:from];
	ONCE_RECEIVED(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,beagleboard.org,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[web.de:+];
	FREEMAIL_FROM(0.00)[web.de];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:8560, ipnet:217.72.192.0/20, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	FREEMAIL_ENVFROM(0.00)[web.de]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: Markus.Elfring@web.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: I2ESC7UJO2WUZFBXXLJ5KCKVQFV4OIF6
X-Message-ID-Hash: I2ESC7UJO2WUZFBXXLJ5KCKVQFV4OIF6
X-Mailman-Approved-At: Wed, 20 Mar 2024 19:58:01 +0000
CC: LKML <linux-kernel@vger.kernel.org>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Johan Hovold <johan@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, Robert Nelson <robertcnelson@beagleboard.org>, Tero Kristo <kristo@kernel.org>, Vaishnav M A <vaishnav.a@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 2/5] spi: Make of_find_spi_controller_by_node() available
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/I2ESC7UJO2WUZFBXXLJ5KCKVQFV4OIF6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> This externalizes and exports the symbol
> of_find_spi_controller_by_node() from the SPI core akin to how
> of_find_i2c_adapter_by_node() is already available. As we will
> need this also for non-dynamic OF setups, we move it under a
> CONFIG_OF check.

Would a change description be more desirable with a corresponding imperative wording?

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.8#n94

Regards,
Markus
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
