Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJxtHqDc0GniBQcAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Apr 2026 11:40:48 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FF039A902
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Apr 2026 11:40:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5B58140448
	for <lists+greybus-dev@lfdr.de>; Sat,  4 Apr 2026 09:40:47 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
	by lists.linaro.org (Postfix) with ESMTPS id D422F3F8FE
	for <greybus-dev@lists.linaro.org>; Thu,  2 Apr 2026 07:00:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=web.de header.s=s29768273 header.b=wIvbiNGc;
	dmarc=pass (policy=quarantine) header.from=web.de;
	spf=pass (lists.linaro.org: domain of Markus.Elfring@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=Markus.Elfring@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1775113226; x=1775718026; i=markus.elfring@web.de;
	bh=Sc/ZEzu3acfbHxr5XoHwwpwJa8iJ6/gjJhVp77agzoE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=wIvbiNGcIjTVxe3aTwnRDwNFL8gXTdjZ+SEHCZMkPaAqfWA1t1+sv9Vj1kW0YnXU
	 mZzt8fZCkBag23WEuJ7Mv5YZU+CFHgjgzByDsRuX7w2zQ2oEkvYe5dw1WS3tEfYV6
	 mq7hTtBKirfrIUzkIbtotGXgb3k3BQei2cJLXksCTD5/ZgN9FbLiW6wQY4Tix1dR3
	 2WFK36YTAZ8T45WP2KpmL2bWfm3tfLyGf5PNsLsxi8ohACs7+FMbFkO4Jiv54TyE6
	 dDYdJqc3hzDLP2k65T4Dwbt/yYYKxE5D44F/cx2vgdwLwXFooMoLjwG9QkOMYDctc
	 IdQP0UvTWLk3cb8PGw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQ8Wg-1vv2uP3jqS-00T6dv; Thu, 02
 Apr 2026 09:00:25 +0200
Message-ID: <b36a8303-e503-4198-83d9-86ecbdd13a2b@web.de>
Date: Thu, 2 Apr 2026 09:00:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Weigang He <geoffreyhe2@gmail.com>, greybus-dev@lists.linaro.org
References: <20260330120801.981506-1-geoffreyhe2@gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260330120801.981506-1-geoffreyhe2@gmail.com>
X-Provags-ID: V03:K1:0KLzWzVfJduXcD0uwnaEcJFSMJN5W+aVZGD5kcBue4McHekf+M1
 SnzGn9NKctyVgqVOqXBxspOhyFF1Vp8vnl/idQzXdEi4t9RQc/Hj/bMZj6v0WmgrdCx6Nv/
 X1T/gVQy/DokTb27YOdKTjzIPhYgNWzfM9VZqJaTfDdY+bkqF1IM/G9A5JZVRcuUe7lJ8Xn
 Rs3DyL9UnZ9KsAvdenkXA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+hRMDb5kr5g=;ABXi0bHN9P9G0nfuDu8Eg9Ka8r5
 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
 WMrDNvKKa2q
X-Spamd-Bar: ---
X-MailFrom: Markus.Elfring@web.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XPLGVZMMVYFQEJBM6F552JFSBFHUCXQF
X-Message-ID-Hash: XPLGVZMMVYFQEJBM6F552JFSBFHUCXQF
X-Mailman-Approved-At: Sat, 04 Apr 2026 09:40:26 +0000
CC: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Alex Elder <elder@kernel.org>, Ayush Singh <ayushdevel1325@gmail.com>, Johan Hovold <johan@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] greybus: gb-beagleplay: fix sleep in atomic context in hdlc_tx_frames()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XPLGVZMMVYFQEJBM6F552JFSBFHUCXQF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[web.de : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[web.de:s=s29768273];
	DATE_IN_PAST(1.00)[50];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.linaro.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.115];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[web.de:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 51FF039A902
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

4oCmDQo+IFRoaXMgYnVnIGlzIGZvdW5kIGJ5IENvZGVRTCBzdGF0aWMgYW5hbHlzaXMgdG9vbCAo
aW50ZXJwcm9jZWR1cmFsDQo+IHNsZWVwLWluLWF0b21pYyBxdWVyeSkgYW5kIG15IGNvZGUgcmV2
aWV3Lg0KDQoqIFdvdWxkIHlvdSBsaWtlIHRvIHBvaW50IGFueSBzY3JpcHRzIG91dCBmb3IgeW91
ciBzb3VyY2UgY29kZSBhbmFseXNpcyBhcHByb2FjaD8NCg0KKiBXaWxsIGEgY292ZXIgbGV0dGVy
IGJlY29tZSBoZWxwZnVsPw0KDQoNClJlZ2FyZHMsDQpNYXJrdXMNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAt
LSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1h
aWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
