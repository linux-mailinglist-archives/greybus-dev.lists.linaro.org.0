Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C5887EFBA
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Mar 2024 19:29:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CB8ED43C3B
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Mar 2024 18:29:13 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
	by lists.linaro.org (Postfix) with ESMTPS id 5A9773F3C8
	for <greybus-dev@lists.linaro.org>; Mon, 18 Mar 2024 17:58:43 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=web.de header.s=s29768273 header.b=V0+kA6Ha;
	dmarc=pass (policy=quarantine) header.from=web.de;
	spf=pass (lists.linaro.org: domain of Markus.Elfring@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=Markus.Elfring@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1710784692; x=1711389492; i=markus.elfring@web.de;
	bh=EY0Hjw4+w2olzLszyx5nxJuGBBuLjuPZp0CFP/bSy4c=;
	h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:
	 In-Reply-To;
	b=V0+kA6HaGYAa/C6ly7UFSp2H0nnpDWqAKynSkm9PMW1zp4uwDho8xbcsfVta02IC
	 TECMyfpHJAgb6tzjOatfb4qt4pKi5/jxsWJBWHFhKpSrdkp538aOPB6WOYHfVjOyy
	 qIT67Jp8LptmP5kgPUS6JDfSSdeVkGMpSYzZbTdb55Vl0cj/BrGPqo+0CcqbnCpWU
	 leM7PVYh0icWowhyZfGGQKJff78MCjMUTx/hmO4gqEvwGILyUlNBeeRIMZrDWYkB5
	 pPUbMmuiGZk200j+p9N1ctRaN8P6SDZN3pBPF/GuNoCOzlmVtewNGA2UcpsHYo0zv
	 eiW33T1QVzxs8Zhb5w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MEUW8-1rXUSX3rQo-00GPBA; Mon, 18
 Mar 2024 18:58:12 +0100
Message-ID: <4fe6f68a-786c-4e3d-b97d-847d6965d1d3@web.de>
Date: Mon, 18 Mar 2024 18:58:10 +0100
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
X-Provags-ID: V03:K1:r2F2bDMqhKgRohtQ/KunHakzfn6SdVEejCaMS6iHsj0TxlpYJDf
 RrWyxna0jlyusRSuyumnI75ggM8jsvsRXuSkQ+/ETO/lUp0oSXC9pz2E4IlOZ9wQh6jBCds
 bS85YDJhYeS6L89hUauyhAwrYwYEqHG2jr+keShniaDz4CFsK+CsnljCojrVTaPQA/g3eCA
 Ml3JtrgsjHUHmOJ/28sfw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ghagHPhdV3o=;yuht04V33nbPduIWJm5LROvF4bF
 /mLWU5oe42zYF7JLibuZkzWFb+gf+YmBIGHGdYu4UCfnOp1aiD+sRl3R7M76F3vkCAhgLNcOF
 YjrgrL7+payvk4Wh2j/YXEAp39TNY52nowu6jOq3so6bt55wnnr5IqPCqWTUA6dhWuzeAwgBY
 SCwBY2LDqW/iwYqiS+5uqWMvA47t+fIgy2ir9HyQBMjF/UUtv/cfjIft4uDta4ez6rPWaBBmh
 qaUoej3dKW0eeEUNPLLWqqasPR+aYU6deVd+jKgXBCDFV8J8nofHQiO0aosdcgnILhANO1boy
 jgUU6rkvVXubH6a6U7HQwbdKWNoi2Iy8gQ5PbyoQwlzWno8Yx4FJJKNv1saruY0/YAbamVukN
 u/CSjXJfPAseIQrjvH49stmGF7mDfANdB7bAvwpkdB8wbzOn4t8zRWLRfbDYXDuf592Qpd5eo
 39pT6uzskfyulbIaJXoT/dGDq8ctIlTfqRSIGFfHYuCyxqA3HDTJVaY8s/cBK+RUqXcB5k+yW
 MAJmdQt3fCxZkTVTfPkzdNdL+5UnmM2uilI9Fuf7Gz9fRmTe+xl4aD+xqrnEr9ZepO0VLu9vF
 owmdMlWsWtxpofgSPasQq0DC3kgfG2amOqvHHIO0gFJYk7iXrJzp4RzkfWfhJIw/RglljeDdP
 w9aSMI+WiY6LOREuBw7/GjP/jhF4xDv0Upy68hS4CyIAXctr0/7OysI0PRa1iiRayjj7DhR4z
 1HtmAUAxid+S57vX0IMxdlzb52Tfl0xs4rwm+MEh4WjqI8sQUReeKqpeAPExHAMVh831maXZV
 Hik+fmwx5psU57Jpl6tquYdXEHmYGXV+ZW7IKksyULOdc=
X-Rspamd-Queue-Id: 5A9773F3C8
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.49 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+a:mout.web.de];
	ONCE_RECEIVED(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[212.227.17.11:from];
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
Message-ID-Hash: F5ZHFOVLPIMWPTBYEV2QLRJF6UP7H5SS
X-Message-ID-Hash: F5ZHFOVLPIMWPTBYEV2QLRJF6UP7H5SS
X-Mailman-Approved-At: Mon, 18 Mar 2024 18:28:57 +0000
CC: LKML <linux-kernel@vger.kernel.org>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Johan Hovold <johan@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, Robert Nelson <robertcnelson@beagleboard.org>, Tero Kristo <kristo@kernel.org>, Vaishnav M A <vaishnav.a@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 4/5] mikrobus: Add mikroBUS driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/F5ZHFOVLPIMWPTBYEV2QLRJF6UP7H5SS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

4oCmDQo+ICsrKyBiL2RyaXZlcnMvbWlzYy9taWtyb2J1cy9taWtyb2J1c19jb3JlLmMNCuKApg0K
PiArc3RhdGljIGludCBtaWtyb2J1c19waW5jdHJsX3NldHVwKHN0cnVjdCBtaWtyb2J1c19wb3J0
ICpwb3J0LA0KPiArCQkJCSAgc3RydWN0IGFkZG9uX2JvYXJkX2luZm8gKmJvYXJkKQ0KPiArew0K
PiArCWludCByZXQ7DQo+ICsNCj4gKwlpZiAoIWJvYXJkIHx8IGJvYXJkLT5waW5fc3RhdGVbTUlL
Uk9CVVNfUElOX1BXTV0gPT0gTUlLUk9CVVNfU1RBVEVfUFdNKQ0KPiArCQlyZXQgPSBtaWtyb2J1
c19waW5jdHJsX3NlbGVjdChwb3J0LCAicHdtX2RlZmF1bHQiKTsNCj4gKwllbHNlDQo+ICsJCXJl
dCA9IG1pa3JvYnVzX3BpbmN0cmxfc2VsZWN0KHBvcnQsICJwd21fZ3BpbyIpOw0K4oCmDQoNCkhv
dyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gYXZvaWQgdGhlIHNwZWNpZmljYXRpb24gb2YgYSBiaXQg
b2YgZHVwbGljYXRlIHNvdXJjZSBjb2RlIGhlcmUNCmJ5IHVzaW5nIGNvbmRpdGlvbmFsIG9wZXJh
dG9yIGV4cHJlc3Npb25zPw0KDQoJcmV0ID0gbWlrcm9idXNfcGluY3RybF9zZWxlY3QocG9ydCwN
CgkJCQkgICAgICAoKCFib2FyZCB8fA0KCQkJCQlib2FyZC0+cGluX3N0YXRlW01JS1JPQlVTX1BJ
Tl9QV01dID09IE1JS1JPQlVTX1NUQVRFX1BXTSkNCgkJCQkgICAgICA/ICJwd21fZGVmYXVsdCIN
CgkJCQkgICAgICA6ICJwd21fZ3BpbyIpKTsNCg0KDQpSZWdhcmRzLA0KTWFya3VzDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWls
aW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBz
ZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
