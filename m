Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A1887EFB9
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Mar 2024 19:29:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CB19E43C35
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Mar 2024 18:29:08 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
	by lists.linaro.org (Postfix) with ESMTPS id E7ED03F3C8
	for <greybus-dev@lists.linaro.org>; Mon, 18 Mar 2024 17:35:35 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=web.de header.s=s29768273 header.b=JogwiI17;
	dmarc=pass (policy=quarantine) header.from=web.de;
	spf=pass (lists.linaro.org: domain of Markus.Elfring@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=Markus.Elfring@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1710783296; x=1711388096; i=markus.elfring@web.de;
	bh=zL2UFIO2avZuf4cHRjFFmzwc7ks5q6OVftTUkucV4BQ=;
	h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:
	 In-Reply-To;
	b=JogwiI17BOi49/yQuCytE7MPZ/qIpHhWfyoqhHAd1TiqdebvHZReeoEAEJSrIeEN
	 DX3zIUxRV8l7Bx7gh0YwFqKSx1gKdlhHNX1961842Z2I6fbVA2Qk+6VDWB76T92n0
	 F2v1Z+ULfkSf/50Zf0cCOiTaNmG7vzwMFcFjQhFGduQl6nnd9CocAGpnT/hY0pZgk
	 mKBXG4pRtCuoMQPwCwy8UmhLKG29gzFTUJIQ77MJ3llLubG0VDuNz2d93DZMhyk8p
	 keSdAdQ5byNbGHds15H2XdG5kOeOEfWCHr4jJu8WsJVf5XsQPOp8NM93EXwNwQj/Q
	 vSNz9+PuUCu6RYyE1g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MzkSZ-1qrOwA3vX7-00vVE0; Mon, 18
 Mar 2024 18:34:56 +0100
Message-ID: <7d834747-0004-4556-b260-c747074a5df6@web.de>
Date: Mon, 18 Mar 2024 18:34:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ayush Singh <ayushdevel1325@gmail.com>,
 Vaishnav M A <vaishnav@beagleboard.org>, devicetree@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, lorforlinux@beagleboard.org,
 greybus-dev@lists.linaro.org
References: <20240317193714.403132-5-ayushdevel1325@gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240317193714.403132-5-ayushdevel1325@gmail.com>
X-Provags-ID: V03:K1:rGQO4fDn0vNN389tBnKe7onogTvUErLvvTXduyGL6pWKFdmDEqy
 MCYn5pkmCHDACrPUJoNy2C7GvGm1hYCvBujMK+WsDmVllQ2MYfQf5+4qeUPkILbJYGTHjoy
 cMNmBfhajyMkcoBbxdstbnNIoU6tToHIwCqiARcUKBEdM5V/z5GbrKM5TGJjdtTWsSdEl7J
 mBvYGlMAiI8JvT71ryP2A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7zD/DEBSM+I=;jR8jlBRRX3dOz59O2ZMyBlQGtol
 u0BPn49w8vjSOeOdVkdxwlyYABexe3OvWICT6qmI9Apqsf9MKaxT8EIV5+CV04pIdjvwBE896
 1ueen8J87DYHuiI3PzZnN+2NoQbCptvE68Jp6AymKTBzPe1vw2VjsReQIqjUJJiKlsQ2jAePP
 Yi/m9dWJ1XlzlQBGURVqOHxAn4n9S+bWzqs6W3pULZkbgnMH8BIU/XqkCnCxReW/TiGzEii/G
 EFpvohWYchriay7ZZv4oP+nPZ633qrUYakf2SIlL69r/Rrvi3Kzze5ppl5HJAmnYB5Wvy0IkZ
 5SLUhpV/0DsR4+SLaUn4EEFq2rjOdWZWriQKIBXcw8/FhoEUQq8tHOeaaxy/AF+wsSUp+15q+
 k10dFxBhHnOfJ2jBWXmNfsIqj1iGGquEu8QzAV69obc26noD1e9qnKhVzWZm8mil9YyHiLYSl
 sDcXCAaccEogysA0PlBqbwcWC38hnHB2qAU89hV63umMfwr/VqD3P30E6/haT6MScpodO0tz0
 rTIaj1KNEQp2qe2SYILnp1syn1GTieirb/cnkJmoFoITI/Y66OX+CAVdyeHaJYDMStfLSljUE
 NnEzzX0PWIkut/Rkg3FOEcPeovfKjha0PoMGYm/x3QDpmDXnMkuunqrxn37M1Hxh5CkcozJzO
 wrXAIyT4AoPvF55AwkS19hbVqbV9J8V5cXn6l0OYdxyjXn+HZZKcaXedRBYmazomRlXQa7dX/
 jFczj4w8pDvlGGnOeRqD3awYga8yynVb2zhc9y2ELKVi6jiWv1GLaNSm87XUSpL2l6Nc/Rc3T
 kES1V8VyySJ69k0OKaP1TK1gG/zBpZ9dRvmKLmTiF3McI=
X-Rspamd-Queue-Id: E7ED03F3C8
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.49 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+a:mout.web.de];
	ONCE_RECEIVED(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[212.227.17.12:from];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,beagleboard.org,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:8560, ipnet:212.227.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[web.de:+];
	RCVD_COUNT_ONE(0.00)[1];
	FREEMAIL_ENVFROM(0.00)[web.de]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: Markus.Elfring@web.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 6ZMKCQVGPAPO4D5DPXJWYPGZOZPAD4WZ
X-Message-ID-Hash: 6ZMKCQVGPAPO4D5DPXJWYPGZOZPAD4WZ
X-Mailman-Approved-At: Mon, 18 Mar 2024 18:28:57 +0000
CC: LKML <linux-kernel@vger.kernel.org>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Johan Hovold <johan@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, Robert Nelson <robertcnelson@beagleboard.org>, Tero Kristo <kristo@kernel.org>, Vaishnav M A <vaishnav.a@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 4/5] mikrobus: Add mikroBUS driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6ZMKCQVGPAPO4D5DPXJWYPGZOZPAD4WZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

4oCmDQo+ICsrKyBiL2RyaXZlcnMvbWlzYy9taWtyb2J1cy9taWtyb2J1c19jb3JlLmMNCuKApg0K
PiArc3RhdGljIGludCBtaWtyb2J1c19waW5jdHJsX3NlbGVjdChzdHJ1Y3QgbWlrcm9idXNfcG9y
dCAqcG9ydCwNCj4gKwkJCQkgICBjb25zdCBjaGFyICpwaW5jdHJsX3NlbGVjdGVkKQ0KPiArew0K
PiArCXN0cnVjdCBwaW5jdHJsX3N0YXRlICpzdGF0ZTsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJ
c3RhdGUgPSBwaW5jdHJsX2xvb2t1cF9zdGF0ZShwb3J0LT5waW5jdHJsLCBwaW5jdHJsX3NlbGVj
dGVkKTsNCj4gKwlpZiAoSVNfRVJSKHN0YXRlKSkgew0KPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9i
ZSgmcG9ydC0+ZGV2LCBQVFJfRVJSKHN0YXRlKSwNCj4gKwkJCQkgICAgICJmYWlsZWQgdG8gZmlu
ZCBzdGF0ZSAlcyIsDQo+ICsJCQkJICAgICBwaW5jdHJsX3NlbGVjdGVkKTsNCj4gKwl9DQrigKYN
Cg0KSSBzdWdnZXN0IHRvIHJlY29uc2lkZXIgdGhlIG5lZWQgZm9yIGV4dHJhIGN1cmx5IGJyYWNr
ZXRzIGhlcmUuDQoNClNlZSBhbHNvOg0KU2VjdGlvbiDigJwzKSBQbGFjaW5nIEJyYWNlcyBhbmQg
U3BhY2Vz4oCdDQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3MvY29kaW5nLXN0
eWxlLnJzdD9oPXY2LjgjbjE5Nw0KDQoNClJlZ2FyZHMsDQpNYXJrdXMNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlz
dCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4g
ZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
