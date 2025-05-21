Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 890FFABF2D3
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 13:28:46 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9F17444409
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 11:28:45 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	by lists.linaro.org (Postfix) with ESMTPS id C1A7A4403A
	for <greybus-dev@lists.linaro.org>; Wed, 21 May 2025 05:41:38 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Hc5W9AJ2;
	spf=pass (lists.linaro.org: domain of braker.noob.kernel@gmail.com designates 209.85.128.181 as permitted sender) smtp.mailfrom=braker.noob.kernel@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-70dda931089so23438107b3.1
        for <greybus-dev@lists.linaro.org>; Tue, 20 May 2025 22:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747806098; x=1748410898; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuKPUIc4ggVixbgxrmfedA4AH8Wix3/q/5/YdGnifww=;
        b=Hc5W9AJ2LMv6pp7QF89fEp/kcGeXaU88a7lxn4b4I60OYuOSEycSy0oGUQaG/+7KNA
         ymkdgq6bM3Ot73amTDymtluN6A3s4EzU0X++WTRQmi9pYDmr4LkPrnxRX0gryjlW+DMw
         +69vaZIGnnGiSvO+Hp+nCqG2g7r/MEw9kQYv8Gzr+kxfO9rDwUl3HqbGneIfylrpnsxe
         vUoey9uN1Q1zejDZ+C+TIEpGCvgI0hr7bs7IcIv2ghX9OfK39YjbIQBZql0jUCIA18Pd
         nFoGdz1SZPV9NWJMY8nLPuV5vTvrsbj1GrHrINev7oKCipxNWF02qdu0Rt39hgnzJlFy
         UNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747806098; x=1748410898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WuKPUIc4ggVixbgxrmfedA4AH8Wix3/q/5/YdGnifww=;
        b=aJF8OnwmQJgdGKuqBLhw5psHboXV1l/ff6jAyFOCMxoDiBh4BHm4z6ED0q0uNn52lr
         z0IZIHZfgBbfdXdkR/FgM6Po+D7mSYSBVwEw9di6qsivWM5oGNLsOqDrHMF/XIgburrO
         UYM/Ko5PhHMkM5XlLRV3SY38dMrQlzKT+uec1vmTzDhhtlUaRJewrvw4RxHixrZTeMb3
         b47IMA412bozSN2PyvsXMhZFDgjnP6IwPsSxFI4J2fouj3UFQ6ApDrg4tXa3M/q7GV7j
         GLz2N9JA8hAhpnc7pL1v5DNhwHVQH+Vec+YD+NpI3ZnB3PT8qXHyD15ugGWcmq4jpZvP
         VyTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw96TDugPhxkXI2/la/3J6gmB1VTBTtMiVhq/lZNSJujquqyO7lwE6BtuS/kjyxR4Zn5mFqEUmNyEgSA==@lists.linaro.org
X-Gm-Message-State: AOJu0Yy8FGUmcQxO9iPEVbDFPiRCO3EJ+fQ3U1VCZTMd27UVUfMI/dEN
	IKK5Dbg/B2brULzSUKw2WfWulhvS1jhjkiYexVEvdLRzIRrWttDvp88A89s6AUxhdAdRISkNmm+
	7O2SG1cYjYWZBh0dLiKb0zbwKqGcjTJU=
X-Gm-Gg: ASbGnct6dmdMoUmSVCJDjgSGYbe4BNjnYuTGU9XCWV+ivIZGY0Pvc2RKLH4xRQ/OZP3
	lG3/obp5N/IqQoAZATNScQLBVjaG1MqWmDF0OmPAHudHpsAwrvFEHdsDmpImcfGNMYpeHUqXhYL
	XzHaoN/ywtpJUM9V+9bW0uO5ajbM2789Im6a2j00kw1qpBRqoki8whojmlZA314b05
X-Google-Smtp-Source: AGHT+IGdSZe7ylfgOWcxywNa73o7coZc7jyagjAA4TlJYJVRxstnsjYUscSako9JGhA3ho960/y7DVvylMCCgAFPLnM=
X-Received: by 2002:a05:690c:4981:b0:70c:b882:2e5 with SMTP id
 00721157ae682-70cb88204d7mr223289207b3.2.1747806098307; Tue, 20 May 2025
 22:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAG+54DZYz-4hW33Py9mihHDauWw55=_rP71s1MbCg-5gxw7J7Q@mail.gmail.com>
 <2025052116-diaphragm-payback-a3ef@gregkh>
In-Reply-To: <2025052116-diaphragm-payback-a3ef@gregkh>
From: rujra <braker.noob.kernel@gmail.com>
Date: Wed, 21 May 2025 11:11:26 +0530
X-Gm-Features: AX0GCFvPSzModwUdGmboKsJgQOYx09zLVKlfPKnab7JQIOmFxYmkMhIanR6ZZLk
Message-ID: <CAG+54Db4k-sMVHUsUWx=oN-AXE5aife=Ugx4f49smGnhq6=-0g@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-7.90 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.90)[99.56%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[mail.gmail.com:mid,mail-yw1-f181.google.com:rdns,mail-yw1-f181.google.com:helo,linuxfoundation.org:email];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	DNSWL_BLOCKED(0.00)[209.85.128.181:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.181:from];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: C1A7A4403A
X-Spamd-Bar: -------
X-MailFrom: braker.noob.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: D2TYBKD5II3PWNA4QEM55YNFTS4UD2YM
X-Message-ID-Hash: D2TYBKD5II3PWNA4QEM55YNFTS4UD2YM
X-Mailman-Approved-At: Wed, 21 May 2025 11:28:40 +0000
CC: Johan Hovold <johan@kernel.org>, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH RESEND] staging : greybus : Documentation : firmware : Replace deprecated strncpy() with strscpy()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/D2TYBKD5II3PWNA4QEM55YNFTS4UD2YM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgZ3JlZywNCg0Kd2h5IGlzIHRoaXMgYSBSRVNFTkQgPzoNCg0KPj4gSSBoYWQgc2VudCB0aGUg
c2FtZSBwYXRjaCA0IGRheXMgYWdvIGFuZCBkaWRuJ3QgZ2V0IGFueSByZXBseSAsIGhlbmNlIHRy
aWVkIHRvIHJlc2VuZCB0aGUgc2FtZSBwYXRjaCBmb3IgdGhlIHNhbWUsDQpoZXJlIGlzIGVhcmxp
ZXIgbWFpbCA6DQpodHRwczovL21haWwuZ29vZ2xlLmNvbS9tYWlsL3UvMS8/aWs9ZjYzYjAzNTE1
ZSZ2aWV3PW9tJnBlcm1tc2dpZD1tc2ctYTpzOjEyMjkwODYzOTMwMjU5NjUxNzIxDQosDQoNCmxp
bmUgZG9lcyBub3QgbWF0Y2ggdGhpczoNCj4+IHNvcnJ5ICwgaSBjb3VsZCBub3QgZ2V0IGl0IHdo
YXQgaXQgaXMgZXhhY3RseSA/LCBpZiBwb3NzaWJsZSBjYW4geW91IHNoYXJlIHNvbWUgaW5zaWdo
dHMgb3IgZXhhbXBsZSBzbyB0aGF0IGZyb20gaW4gZnV0dXJlIGkgd291bGQgZ2V0IGl0IHJpZ2h0
Lg0KDQp0aGFuayB5b3UsDQpydWpyYSBiaGF0dA0KDQoNCg0KT24gV2VkLCBNYXkgMjEsIDIwMjUg
YXQgMTE6MDDigK9BTSBHcmVnIEtIIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6
DQo+DQo+IE9uIFdlZCwgTWF5IDIxLCAyMDI1IGF0IDEwOjI2OjUyQU0gKzA1MzAsIHJ1anJhIHdy
b3RlOg0KPiA+IFRvIGVuc3VyZSB0aGF0IHRoZSBmaXJtd2FyZSB0YWcgaXMgcHJvcGVybHkgbnVs
bC10ZXJtaW5hdGVkLiBXaGVuDQo+ID4gY29weWluZyBmaXJtd2FyZSB0YWcgc3RyaW5ncyB0byBw
cmV2ZW50IGJ1ZmZlciBvdmVyZmxvd3MgYW5kIGVuc3VyZQ0KPiA+IGRhdGEgaW50ZWdyaXR5Lg0K
PiA+DQo+ID4NCj4gPiBjaGFuZ2VzIGhhcyBiZWVuIG1hZGUgaW4gMyBwb3NpdGlvbnM6DQo+ID4g
MTogdXBkYXRlIGZpcm13YXJlIHRhZw0KPiA+IDI6IGJhY2tlbmQgdXBkYXRlIGZpcm13YXJlIHRh
Zw0KPiA+IDM6IGJhY2tlbmQgdXBkYXRlIGZpcm13YXJlIHRhZyB3aXRoIHVuaXBybw0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogUnVqcmEgQmhhdHQgPGJyYWtlci5ub29iLmtlcm5lbEBnbWFpbC5j
b20+DQo+DQo+IFlvdXIgRnJvbTogbGluZSBkb2VzIG5vdCBtYXRjaCB0aGlzIDooDQo+DQo+IEFs
c28sIHdoeSBpcyB0aGlzIGEgIlJFU0VORCI/DQo+DQo+IHRoYW5rcywNCj4NCj4gZ3JlZyBrLWgN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMt
ZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vi
c2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9y
Zwo=
