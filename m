Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 877708678F8
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Feb 2024 15:48:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 96DE440D80
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Feb 2024 14:48:31 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	by lists.linaro.org (Postfix) with ESMTPS id BFE933EEF1
	for <greybus-dev@lists.linaro.org>; Sun, 25 Feb 2024 09:50:00 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=P1ZcRohV;
	spf=pass (lists.linaro.org: domain of dileepsankhla.ds@gmail.com designates 209.85.128.175 as permitted sender) smtp.mailfrom=dileepsankhla.ds@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-60821136c5aso14821977b3.1
        for <greybus-dev@lists.linaro.org>; Sun, 25 Feb 2024 01:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708854600; x=1709459400; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4MwmdceTTW6yTK6dn3O1uN2xQAdcjCnqlQIDQJMZQo=;
        b=P1ZcRohVUkNSTDbm1xo/QQLLlmyEQ2gV7ZrtJHgk3jXZrAAw5/l+V2cBpwkgdHpaor
         16U/iC1zhi0vAOzSqY006Q5bI4sey6+3rgOqb/xmK6tw1mc92jErwF/D4Fnw1AdsCNZF
         2JwDz3TQs6C5M8Ct4gKsCk8VDoyrVz9pwU3YrISVT5eQy6D0Bo50Bue5pnYezLUMBxf5
         l8ldszvdVgmmHeESKuWXb4zsXu1TERbwFLfQh8AOmzTXChwHaU8Rf+HKYZSCg90fmnaD
         xKBHZ0MxhWYEXPY5eFX/Bj98rpdL1D53oR+3PMue6LVpgkpbDqsGAzVD8rVu5/bdOPpu
         z+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708854600; x=1709459400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4MwmdceTTW6yTK6dn3O1uN2xQAdcjCnqlQIDQJMZQo=;
        b=mdAPnTaZVwK7TPfsI3klasNVnO10Da+6zf3p+BP6woEgYdMGLnZnIVPKwqkIFfp742
         L79A72Nmb8UlFqWbgAYJR3jfLpaL21P7N03tyfGWeEaLkzzFnEEPbAnDNl0PDhoLUVQF
         zsBIkgahMqJ9V6hnq/4FV5tH5G6pjNWeryatsFyhoyRzxez1lk9ID50S5pYQPoNrCMxN
         cmazy3qIob2fyD2X8CB8IN9LZrMPQz4ksXUiXoF8zN5Mm5vf4+PsfOWaJ79H2nWGmke+
         6tqdYouV28FoZiu8NK9EBKZUfZjnZOV6XuIB66SpsJbpzrpjA/DtwaYbFHxFu3bYU/3s
         aGHw==
X-Gm-Message-State: AOJu0YykRRQWt7ve7M2IyC5GpJiZM4BQfFVb+9lmR6squKnln82TGSE9
	ZNTF6//J54WcAdxgvbiCMUj1RHRZc6JabjvbtAY9mgLh9rtVEEb2NIYL93m0E5W8bImisF+VyyQ
	+Q4azAPPk13LqESmx5eMD0U6PPvk=
X-Google-Smtp-Source: AGHT+IGliUFzZzSMB8+3Z2QJ9rdqkRgFL0iBBELGWFni7I8zkucsPnyVtOLt5vCl0HnYHKO9ztyFFZNjBPCDyrJR8WM=
X-Received: by 2002:a81:be0e:0:b0:607:87cd:9395 with SMTP id
 i14-20020a81be0e000000b0060787cd9395mr3610315ywn.17.1708854600306; Sun, 25
 Feb 2024 01:50:00 -0800 (PST)
MIME-Version: 1.0
References: <20240225084017.418773-1-dileepsankhla.ds@gmail.com> <2024022538-buffoon-praising-f748@gregkh>
In-Reply-To: <2024022538-buffoon-praising-f748@gregkh>
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Date: Sun, 25 Feb 2024 15:19:49 +0530
Message-ID: <CAHxc4bsFj1=VFVDWbdwo3W3CmSyPG1585p2zBePpsD9qy6VKdA@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: BFE933EEF1
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.175:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-MailFrom: dileepsankhla.ds@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: DI4YLKQ2STONFW3BSGOMULYNUZKKHBKF
X-Message-ID-Hash: DI4YLKQ2STONFW3BSGOMULYNUZKKHBKF
X-Mailman-Approved-At: Mon, 26 Feb 2024 14:48:18 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: put macro in a do - while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DI4YLKQ2STONFW3BSGOMULYNUZKKHBKF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gU3VuLCBGZWIgMjUsIDIwMjQgYXQgMjoyNuKAr1BNIEdyZWcgS0ggPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPiB3cm90ZToNCj4gRGlkIHlvdSB0ZXN0IGJ1aWxkIHRoaXM/DQoNCkhlbGxv
IEdyZWcsDQoNClllcy4gTm8gbmV3IHdhcm5pbmcvZXJyb3Igd2FzIGVuY291bnRlcmVkIG9uIGJ1
aWxkaW5nIHRoZSBrZXJuZWwuDQoNCj4gPiAgI2RlZmluZSBnYl9sb29wYmFja19hdHRyKGZpZWxk
LCB0eXBlKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ID4gIHN0
YXRpYyBzc2l6ZV90IGZpZWxkIyNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXA0KPg0KPiBXaHkgZGlkIHlvdSBvbmx5IGNoYW5nZSBvbmUgaWYg
eW91IHRob3VnaHQgdGhpcyB3YXMgYSB2YWxpZCBjaGFuZ2U/DQoNCjEuIEFzIHBlciBteSBDIGJh
Y2tncm91bmQsIEkgdGhpbmsgbm8gb3RoZXIgbWFjcm9zIGluIHRoZSBhYm92ZSBzb3VyY2UNCmNv
ZGUgZmlsZSBuZWVkIHRvIGJlIGVuY2xvc2VkIGluIGEgZG8gLSB3aGlsZSBsb29wLg0KMi4gSSBh
bSB3cml0aW5nIHRoZSBwYXRjaCBiZWNhdXNlIG9mIHRoZSBFdWR5cHR1bGEgQ2hhbGxlbmdlLCBh
bmQgSQ0KaGF2ZSB0byBmaXggIm9uZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbSIgaW4gYW55IG9mIHRo
ZSBmaWxlcyBpbg0KZHJpdmVycy9zdGFnaW5nLy4gVGhlIGFib3ZlIG9uZSB3YXMgb25lIG9mIHRo
ZW0uDQoNClJlZ2FyZHMsDQpEaWxlZXANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBs
aXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1k
ZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
