Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CsBNOUel2m9uwIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Feb 2026 15:32:05 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F4615F826
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Feb 2026 15:32:05 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 21E55401D3
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Feb 2026 14:32:04 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	by lists.linaro.org (Postfix) with ESMTPS id 1E1343F803
	for <greybus-dev@lists.linaro.org>; Thu, 19 Feb 2026 14:32:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=vUSGAk1x;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.67 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so6173595e9.3
        for <greybus-dev@lists.linaro.org>; Thu, 19 Feb 2026 06:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771511520; x=1772116320; darn=lists.linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i+qKFoabRqEgBnmXyIvDdSokcUG88HYAtO4ot0il4iw=;
        b=vUSGAk1xfG61qSkAr8T8NysRVua5/XxKFqz70j3px0XHs1xo6pylTvi+UUZjGgvNoJ
         zTnkp8PeUl8uuxdr1xysgDHPfH8e84b6WJFj/68CabQHdV5MEvgCGuOa+R6gh0uc9+9s
         tTuSTqux6C7bB4AIIVPSuCidD+SBbPFvmEW5T6PoL2OYQ9g17Pk9Arp07fRbW6p38AQC
         mg+21nXZw2TXP45eKKpBP8ou9VxXBVovhJl40S5FPcmMg7DNUJGKdOH/XPgg9NsZa+oV
         w2FscI0E71K8fJe3wdx7AzvNrefjJRi7YMEoABKbXodM6NEHQEcwiwhheh4RnbXg5hVR
         O76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771511520; x=1772116320;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+qKFoabRqEgBnmXyIvDdSokcUG88HYAtO4ot0il4iw=;
        b=Q1L47yli/ntCc9nPA+3WsTafp1CxJqtPkQdeSF4YLvKXSYNA/C3C0Ce/UjbUK8CYNW
         eSVkdlKli8PBcVDBXuh2hYTwQ7ZgD1sSQ2UrM5X5v/hSj589pHFEZUHx4U3ux//5hYaF
         +uBFHuRz1bzv20x/WnibjeFl0l8Cab4/OwN2jFDdSi1YBUIcraMSXFMr93yBPSqrvLIV
         49zUi5hZqGspoXb/JqUpyl59+Tyc6WS0+1drpVPqSSru7fZjBi0hpPpKC+GsRXIxgMZJ
         Ozs5plKnPxu/eOlFrnyXpChbH9OQxByxaALPd+iZnuq+6SKIoZEE59YiT3cg1rhR8f8O
         aRAw==
X-Forwarded-Encrypted: i=1; AJvYcCXWbZ60Zc/H6Kts8Qbg6bStLEFFO6tmDquXMSLGTdfvDnT2sK2e6DNl/lYDcZUA1brbZ2chGRQUcQ/wag==@lists.linaro.org
X-Gm-Message-State: AOJu0YzBfWUMdS70oyP8Ex3JQ+oVuPAyAScoT9o2C3MVyjkaP/M3aKmG
	+UGqZXM4cvE6x+7mlo2HmMkzmHJE23Wv6JUImhcS+Xne/1awYlcxN/vpssHPNIhvDEvWAA==
X-Gm-Gg: AZuq6aKbKDx/0ICRydq+Yw2Uq78yryRVnAsDOEssoSEWvC87lr2voIgDIQCkeSL9s3A
	Jyadzel8OFVyv4kyTSbYNzYrp4WC9qW4jrTnqXlf2QS2YGR1C8OMLbphijw5pZavt1kqc//5256
	pY6ZAz3gDwgaqpZtFjQqh8ymuXNriVzubbltvahJXElz7k2HQCfslgqEb7Wm94fVEvdf23H8rIh
	NVRVVQhPfs3FL5lwGkc/Afompevhh081XIzalViY7/2u+JBOleUmscV+LmSI/9IJAW+tyjSDiXT
	y6KFSLTOtKSmkqlT/SDhiLQlUlD4MxvfQ/eEBwZQq7NDNcDpPIp8OWyYd3DrOBYujtkfAtNaUSs
	7bdQ8cHzkZ4V/cK3hbgpg+f3QUJyzTJPsx9kWtpc1ec1NVFN9iL5+msJAHUwvesH9HcaI18j00a
	oWv9CuRO59o2Hk8roXwyK+3w4nmIYT
X-Received: by 2002:a05:600c:a51:b0:480:1e40:3d2 with SMTP id 5b1f17b1804b1-4839e6682a2mr41932915e9.29.1771511519890;
        Thu, 19 Feb 2026 06:31:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5b2d1sm52919229f8f.4.2026.02.19.06.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 06:31:59 -0800 (PST)
Date: Thu, 19 Feb 2026 17:31:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?utf-8?Q?Bart=C5=82omiej?= Konecki <bartekkonecki97@gmail.com>
Message-ID: <aZce3JIfKM_FgzyC@stanley.mountain>
References: <aZcP88KGUnxDBjTT@LT495s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZcP88KGUnxDBjTT@LT495s>
X-Spamd-Bar: ----
Message-ID-Hash: 62LF6LHVY4K3UHGZMNLHE43PFMJH3ZC7
X-Message-ID-Hash: 62LF6LHVY4K3UHGZMNLHE43PFMJH3ZC7
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: document codec mutex usage
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/62LF6LHVY4K3UHGZMNLHE43PFMJH3ZC7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.91 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_SPAM(0.00)[0.886];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,greybus-dev-bounces@lists.linaro.org];
	R_DKIM_REJECT(0.00)[linaro.org:s=google];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 42F4615F826
X-Rspamd-Action: no action

T24gVGh1LCBGZWIgMTksIDIwMjYgYXQgMDI6Mjg6MTlQTSArMDEwMCwgQmFydMWCb21pZWogS29u
ZWNraSB3cm90ZToNCj4gQWRkIGNvbW1lbnRzIGRlc2NyaWJpbmcgbG9jayBhbmQgcmVnaXN0ZXJf
bXV0ZXgNCj4gaW4gc3RydWN0IGdiYXVkaW9fY29kZWNfaW5mby4NCj4gVGhlIGxvY2sgcHJvdGVj
dHMgdGhlIGNvZGVjIHJ1bnRpbWUgc3RhdGUgYW5kIG1vZHVsZS9EQUkgbGlzdHMsIHdoaWxlDQo+
IHJlZ2lzdGVyX211dGV4IHByb3RlY3RzIGhhcmR3YXJlIHJlZ2lzdGVycy4NCj4gSW1wcm92ZSBy
ZWFkYWJpbGl0eSBhbmQgY2xhcmlmeSBsb2NraW5nIHNlbWFudGljcy4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEJhcnTFgm9taWVqIEtvbmVja2kgPGJhcnRla2tvbmVja2k5N0BnbWFpbC5jb20+DQo+
IC0tLQ0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuaCB8IDMgKystDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuaCBiL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmgNCj4gaW5kZXggZjNmN2E3ZWM2YmU0Li45
MGRkMzQyNmQ0YTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlv
X2NvZGVjLmgNCj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuaA0K
PiBAQCAtNzAsOCArNzAsOSBAQCBzdHJ1Y3QgZ2JhdWRpb19jb2RlY19pbmZvIHsNCj4gIAlzdHJ1
Y3QgbGlzdF9oZWFkIG1vZHVsZV9saXN0Ow0KPiAgCS8qIHRvIG1haW50YWluIHJ1bnRpbWUgc3Ry
ZWFtIHBhcmFtcyBmb3IgZWFjaCBEQUkgKi8NCj4gIAlzdHJ1Y3QgbGlzdF9oZWFkIGRhaV9saXN0
Ow0KPiAtCXN0cnVjdCBtdXRleCBsb2NrOw0KPiArCXN0cnVjdCBtdXRleCBsb2NrOwkvKiBwcm90
ZWN0cyBjb2RlYyBzdGF0ZSBhbmQgbW9kdWxlL0RBSSBsaXN0cyAqLw0KPiAgCXN0cnVjdCBtdXRl
eCByZWdpc3Rlcl9tdXRleDsNCj4gKwkvKiBzZXJpYWxpemVzIGFjY2VzcyB0byBjb2RlYyBoYXJk
d2FyZSByZWdpc3RlcnMqLw0KDQpObywgaXQgZG9lc24ndC4NCg0KcmVnYXJkcywNCmRhbiBjYXJw
ZW50ZXINCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Z3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcK
VG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5s
aW5hcm8ub3JnCg==
