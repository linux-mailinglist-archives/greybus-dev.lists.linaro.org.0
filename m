Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 85006ADEA5D
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Jun 2025 13:38:46 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 576C1446AA
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Jun 2025 11:38:45 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	by lists.linaro.org (Postfix) with ESMTPS id BDD0B43FBD
	for <greybus-dev@lists.linaro.org>; Wed, 18 Jun 2025 06:27:43 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=i2IAspbo;
	spf=pass (lists.linaro.org: domain of pranav.tyagi03@gmail.com designates 209.85.167.54 as permitted sender) smtp.mailfrom=pranav.tyagi03@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5534edc646dso6992131e87.1
        for <greybus-dev@lists.linaro.org>; Tue, 17 Jun 2025 23:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750228062; x=1750832862; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UK3zIT17fxpiOCoUtOLwH3cyUrlx/S+uNQT2nYw/j7Q=;
        b=i2IAspbov6zjOycH5tbzJsbkd6XhHbWD3ByDaW43iVdDQbRp66LLXNZu+i/gnmAJhW
         2fhwuNmk2n03i85b68y1a5BX3rlKkl3MyjVnBLq5/UGaHWCWb7AYr9UYyk0dcdl9ggh/
         SnPdQTEFDLsDHlzegWPyMD5+WtNQG5wwZki6IqUCd3bXAoWDv2yu3jTE+UofjTzgfuk+
         piLe3sbrN0vWwu+TYAaVvjOYgJOeNVvmUsS34OZLkjICu7rbtmMp1ep4xjSXj+LS/v6D
         eE7AG2IeTx5RmwvZiMFQQxwKjix7Rl5Yghmc8akNQzaMIe5xhnrwv3JopmzYaOLrbIVv
         CFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750228062; x=1750832862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UK3zIT17fxpiOCoUtOLwH3cyUrlx/S+uNQT2nYw/j7Q=;
        b=BjFMtiZFNpfOpiV5jOdsBc0T5hOnEn10HieB/f6eoPVReIvVUZ4m0U7s2U6cor/Ph7
         lqfokS37PbIXPTVWnoICKcAX8zE7bt88bfRlpMPyiPPtekV0LNp1gsBYse5YCFOKWHr0
         N21a5xYCu/vSWAuquOK4AV2pmKL2kC+INmpspadiu5QHWcqCQ8QIlcE42ql01e3WFMef
         hx2YzgSvuKpqLoShJ+mUPIG+38+xLo2r8/F6Mp2cYeP2KBbZ/qLHxNHnAqBeCAwRMP4v
         n54xoyQsSCuz38FgBpqpfC2aagI6AUOCFh6lTfbcl9LGOF2cE7V3vtD18aGGgS2qu97P
         1ZQw==
X-Forwarded-Encrypted: i=1; AJvYcCXN28EXyfS9I3LFQswoW+N8OpxED+UYFtGzAvtIczRcgf/XjftoPuxdz9thqEjSdTekDT5LfwfqUHC8Xg==@lists.linaro.org
X-Gm-Message-State: AOJu0YyqZEO0OiNt/Fzh4yX975rdGfY+L2KHO3dCbcQOX51WcBXPQdTd
	rmb5iffSkdHIkHOSLZp2UshhfphavoefZhZ3BtsBVD/KytJ03BmncH45bdnYzGfZteK4ItiMvax
	lYQNUuYxyBxo8iI2R2CpZDb8SI8jHsknEkbn171M=
X-Gm-Gg: ASbGncvugOn/WcdbLh5WhTxwv7gEFQhVxwZPSFZLQKNtkIt6t9H1ohQm5cCApy4Wdnu
	BPh+nEOxd2XCZqKOzHvnU5f5pNIrCMy+zqj5YaJZsRJTEOBJ1dcSYQGmlMMpYjIXJ8Dfh0p+2Dg
	hTIM2LzxZEBv3yuJV6CM7479rAHOGGPmlW+ZAhmYYVQTfyV0oXIOzqa6mdSgpRMxNZZK/yDt7/+
	8AmLQ==
X-Google-Smtp-Source: AGHT+IFzclqmdVYnh9bn5OftmS6r65aUYN8NNKEj6r9Iyg5dqC68jtjtrYT2lTnS+3l/ASSE53QIq5/5axxl6L75mvY=
X-Received: by 2002:a05:6512:6ca:b0:553:6488:fa56 with SMTP id
 2adb3069b0e04-553b6f42225mr4348650e87.43.1750228062258; Tue, 17 Jun 2025
 23:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250617125137.24503-1-pranav.tyagi03@gmail.com> <2025061743-surging-legwarmer-b3a9@gregkh>
In-Reply-To: <2025061743-surging-legwarmer-b3a9@gregkh>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Wed, 18 Jun 2025 11:57:30 +0530
X-Gm-Features: Ac12FXxz57hTn__qDBfgtwWqrWJFimTpv9FC7DveT5JsGtxfM3_WuWsO6gHWEyQ
Message-ID: <CAH4c4jJZ_CNwPpYVx1pMU2U26PDOFzsjcd+qr2-PHfgF47ywAg@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	DNSWL_BLOCKED(0.00)[209.85.167.54:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.54:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: BDD0B43FBD
X-Spamd-Bar: -------
X-MailFrom: pranav.tyagi03@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 32LXW4G6BENTYBXYDCL3NJ75CDRETWUV
X-Message-ID-Hash: 32LXW4G6BENTYBXYDCL3NJ75CDRETWUV
X-Mailman-Approved-At: Wed, 18 Jun 2025 11:38:42 +0000
CC: johan@kernel.org, elder@kernel.org, vireshk@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: firmware: use strscpy, fix tag size
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/32LXW4G6BENTYBXYDCL3NJ75CDRETWUV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBKdW4gMTcsIDIwMjUgYXQgNjo0NuKAr1BNIEdyZWcgS0ggPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPiB3cm90ZToNCj4NCj4gT24gVHVlLCBKdW4gMTcsIDIwMjUgYXQgMDY6MjE6
MzdQTSArMDUzMCwgUHJhbmF2IFR5YWdpIHdyb3RlOg0KPiA+IEluY3JlYXNlIHRoZSBzaXplIG9m
IGZpcm13YXJlX3RhZyBhcnJheXMgaW4gdGhlIGZvbGxvd2luZyBzdHJ1Y3RzIGZyb20NCj4gPiBH
Ql9GSVJNV0FSRV9VX1RBR19NQVhfU0laRSB0byBHQl9GSVJNV0FSRV9VX1RBR19NQVhfU0laRSAr
IDEgdG8NCj4gPiBhY2NvbW1vZGF0ZSBudWxsIHRlcm1pbmF0aW9uOg0KPiA+ICAgICAgIC0gZndf
bWdtdF9pb2NfaW50Zl9sb2FkX2FuZF92YWxpZGF0ZQ0KPiA+ICAgICAgIC0gZndfbWdtdF9pb2Nf
Z2V0X2JhY2tlbmRfdmVyc2lvbg0KPiA+ICAgICAgIC0gZndfbWdtdF9pb2NfYmFja2VuZF9md191
cGRhdGUNCj4gPiAgICAgICAtIGZ3X21nbXRfaW9jX2dldF9pbnRmX3ZlcnNpb24NCj4gPg0KPiA+
IFJlcGxhY2Ugc3RybmNweSgpIHdpdGggc3Ryc2NweSgpIHRvIGVuc3VyZSBwcm9wZXIgbnVsbCB0
ZXJtaW5hdGlvbiBhcw0KPiA+IGZpcm13YXJlX3RhZyBpcyBpbnRlcnByZXRlZCBhcyBhIG51bGwt
dGVybWluYXRlZCBzdHJpbmcNCj4gPiBhbmQgcHJpbnRlZCB3aXRoICVzLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogUHJhbmF2IFR5YWdpIDxwcmFuYXYudHlhZ2kwM0BnbWFpbC5jb20+DQo+ID4g
LS0tDQo+ID4gIC4uLi9ncmV5YnVzL0RvY3VtZW50YXRpb24vZmlybXdhcmUvZmlybXdhcmUuYyAg
ICAgICAgfCAxMiArKysrKystLS0tLS0NCj4gPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ3Jl
eWJ1c19maXJtd2FyZS5oICAgICAgICAgICB8ICA4ICsrKystLS0tDQo+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvRG9jdW1lbnRhdGlvbi9maXJtd2FyZS9maXJt
d2FyZS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvRG9jdW1lbnRhdGlvbi9maXJtd2FyZS9m
aXJtd2FyZS5jDQo+ID4gaW5kZXggNzY1ZDY5ZmFhOWNjLi4zYjQwNjFmNGIzNGEgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvRG9jdW1lbnRhdGlvbi9maXJtd2FyZS9m
aXJtd2FyZS5jDQo+ID4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvRG9jdW1lbnRhdGlv
bi9maXJtd2FyZS9maXJtd2FyZS5jDQo+ID4gQEAgLTYzLDggKzYzLDggQEAgc3RhdGljIGludCB1
cGRhdGVfaW50Zl9maXJtd2FyZShpbnQgZmQpDQo+ID4gICAgICAgaW50Zl9sb2FkLm1ham9yID0g
MDsNCj4gPiAgICAgICBpbnRmX2xvYWQubWlub3IgPSAwOw0KPiA+DQo+ID4gLSAgICAgc3RybmNw
eSgoY2hhciAqKSZpbnRmX2xvYWQuZmlybXdhcmVfdGFnLCBmaXJtd2FyZV90YWcsDQo+ID4gLSAg
ICAgICAgICAgICBHQl9GSVJNV0FSRV9VX1RBR19NQVhfU0laRSk7DQo+ID4gKyAgICAgc3Ryc2Nw
eSgoY2hhciAqKSZpbnRmX2xvYWQuZmlybXdhcmVfdGFnLCBmaXJtd2FyZV90YWcsDQo+ID4gKyAg
ICAgICAgICAgICBHQl9GSVJNV0FSRV9VX1RBR19NQVhfU0laRSArIDEpOw0KPiA+DQo+ID4gICAg
ICAgcmV0ID0gaW9jdGwoZmQsIEZXX01HTVRfSU9DX0lOVEZfTE9BRF9BTkRfVkFMSURBVEUsICZp
bnRmX2xvYWQpOw0KPiA+ICAgICAgIGlmIChyZXQgPCAwKSB7DQo+ID4gQEAgLTEwMSw4ICsxMDEs
OCBAQCBzdGF0aWMgaW50IHVwZGF0ZV9iYWNrZW5kX2Zpcm13YXJlKGludCBmZCkNCj4gPiAgICAg
ICAvKiBHZXQgQmFja2VuZCBGaXJtd2FyZSBWZXJzaW9uICovDQo+ID4gICAgICAgcHJpbnRmKCJH
ZXR0aW5nIEJhY2tlbmQgRmlybXdhcmUgVmVyc2lvblxuIik7DQo+ID4NCj4gPiAtICAgICBzdHJu
Y3B5KChjaGFyICopJmJhY2tlbmRfZndfaW5mby5maXJtd2FyZV90YWcsIGZpcm13YXJlX3RhZywN
Cj4gPiAtICAgICAgICAgICAgIEdCX0ZJUk1XQVJFX1VfVEFHX01BWF9TSVpFKTsNCj4gPiArICAg
ICBzdHJzY3B5KChjaGFyICopJmJhY2tlbmRfZndfaW5mby5maXJtd2FyZV90YWcsIGZpcm13YXJl
X3RhZywNCj4gPiArICAgICAgICAgICAgIEdCX0ZJUk1XQVJFX1VfVEFHX01BWF9TSVpFICsgMSk7
DQo+ID4NCj4gPiAgcmV0cnlfZndfdmVyc2lvbjoNCj4gPiAgICAgICByZXQgPSBpb2N0bChmZCwg
RldfTUdNVF9JT0NfR0VUX0JBQ0tFTkRfRlcsICZiYWNrZW5kX2Z3X2luZm8pOw0KPiA+IEBAIC0x
MjksOCArMTI5LDggQEAgc3RhdGljIGludCB1cGRhdGVfYmFja2VuZF9maXJtd2FyZShpbnQgZmQp
DQo+ID4gICAgICAgLyogVHJ5IEJhY2tlbmQgRmlybXdhcmUgVXBkYXRlIG92ZXIgVW5pcHJvICov
DQo+ID4gICAgICAgcHJpbnRmKCJVcGRhdGluZyBCYWNrZW5kIEZpcm13YXJlXG4iKTsNCj4gPg0K
PiA+IC0gICAgIHN0cm5jcHkoKGNoYXIgKikmYmFja2VuZF91cGRhdGUuZmlybXdhcmVfdGFnLCBm
aXJtd2FyZV90YWcsDQo+ID4gLSAgICAgICAgICAgICBHQl9GSVJNV0FSRV9VX1RBR19NQVhfU0la
RSk7DQo+ID4gKyAgICAgc3Ryc2NweSgoY2hhciAqKSZiYWNrZW5kX3VwZGF0ZS5maXJtd2FyZV90
YWcsIGZpcm13YXJlX3RhZywNCj4gPiArICAgICAgICAgICAgIEdCX0ZJUk1XQVJFX1VfVEFHX01B
WF9TSVpFICsgMSk7DQo+ID4NCj4gPiAgcmV0cnlfZndfdXBkYXRlOg0KPiA+ICAgICAgIGJhY2tl
bmRfdXBkYXRlLnN0YXR1cyA9IDA7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2dyZXlidXNfZmlybXdhcmUuaCBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dyZXli
dXNfZmlybXdhcmUuaA0KPiA+IGluZGV4IGI2MDQyYTgyYWRhNC4uYWQ1YjJjOGE2NDYxIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dyZXlidXNfZmlybXdhcmUuaA0K
PiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dyZXlidXNfZmlybXdhcmUuaA0KPiA+
IEBAIC0zOCwyMCArMzgsMjAgQEANCj4gPg0KPiA+ICAvKiBJT0NUTCBzdXBwb3J0ICovDQo+ID4g
IHN0cnVjdCBmd19tZ210X2lvY19nZXRfaW50Zl92ZXJzaW9uIHsNCj4gPiAtICAgICBfX3U4IGZp
cm13YXJlX3RhZ1tHQl9GSVJNV0FSRV9VX1RBR19NQVhfU0laRV07DQo+ID4gKyAgICAgX191OCBm
aXJtd2FyZV90YWdbR0JfRklSTVdBUkVfVV9UQUdfTUFYX1NJWkUgKyAxXTsNCj4gPiAgICAgICBf
X3UxNiBtYWpvcjsNCj4gPiAgICAgICBfX3UxNiBtaW5vcjsNCj4gPiAgfSBfX3BhY2tlZDsNCj4g
Pg0KPiA+ICBzdHJ1Y3QgZndfbWdtdF9pb2NfZ2V0X2JhY2tlbmRfdmVyc2lvbiB7DQo+ID4gLSAg
ICAgX191OCBmaXJtd2FyZV90YWdbR0JfRklSTVdBUkVfVV9UQUdfTUFYX1NJWkVdOw0KPiA+ICsg
ICAgIF9fdTggZmlybXdhcmVfdGFnW0dCX0ZJUk1XQVJFX1VfVEFHX01BWF9TSVpFICsgMV07DQo+
ID4gICAgICAgX191MTYgbWFqb3I7DQo+ID4gICAgICAgX191MTYgbWlub3I7DQo+ID4gICAgICAg
X191OCBzdGF0dXM7DQo+ID4gIH0gX19wYWNrZWQ7DQo+ID4NCj4gPiAgc3RydWN0IGZ3X21nbXRf
aW9jX2ludGZfbG9hZF9hbmRfdmFsaWRhdGUgew0KPiA+IC0gICAgIF9fdTggZmlybXdhcmVfdGFn
W0dCX0ZJUk1XQVJFX1VfVEFHX01BWF9TSVpFXTsNCj4gPiArICAgICBfX3U4IGZpcm13YXJlX3Rh
Z1tHQl9GSVJNV0FSRV9VX1RBR19NQVhfU0laRSArIDFdOw0KPiA+ICAgICAgIF9fdTggbG9hZF9t
ZXRob2Q7DQo+ID4gICAgICAgX191OCBzdGF0dXM7DQo+ID4gICAgICAgX191MTYgbWFqb3I7DQo+
ID4gQEAgLTU5LDcgKzU5LDcgQEAgc3RydWN0IGZ3X21nbXRfaW9jX2ludGZfbG9hZF9hbmRfdmFs
aWRhdGUgew0KPiA+ICB9IF9fcGFja2VkOw0KPiA+DQo+ID4gIHN0cnVjdCBmd19tZ210X2lvY19i
YWNrZW5kX2Z3X3VwZGF0ZSB7DQo+ID4gLSAgICAgX191OCBmaXJtd2FyZV90YWdbR0JfRklSTVdB
UkVfVV9UQUdfTUFYX1NJWkVdOw0KPiA+ICsgICAgIF9fdTggZmlybXdhcmVfdGFnW0dCX0ZJUk1X
QVJFX1VfVEFHX01BWF9TSVpFICsgMV07DQo+ID4gICAgICAgX191OCBzdGF0dXM7DQo+ID4gIH0g
X19wYWNrZWQ7DQo+ID4NCj4NCj4gWW91IGFyZSBjaGFuZ2luZyB0aGUgc2l6ZSBvZiBhIHVzZXJz
cGFjZSBzdHJ1Y3R1cmUgaGVyZSwgYXJlIHlvdSBTVVJFDQo+IHRoaXMgaXMgYWxsb3dlZD8NCj4N
Cj4gSG93IHdhcyB0aGlzIHRlc3RlZD8NCj4NCj4gdGhhbmtzLA0KPg0KPiBncmVnIGstaA0KDQpI
aSwNCg0KWW91J3JlIGFic29sdXRlbHkgcmlnaHQg4oCUIGNoYW5naW5nIHRoZSBzaXplIG9mIGEg
dXNlcnNwYWNlLXZpc2libGUNCnN0cnVjdHVyZSBsaWtlIHRoaXMgaXMgbm90IGFsbG93ZWQgYW5k
IEkgYXBvbG9naXplIGZvciB0aGUgb3ZlcnNpZ2h0Lg0KDQpJIGRpZCBjb21waWxlIGFuZCBib290
IHRoZSBrZXJuZWwgd2l0aCB0aGUgcGF0Y2ggYXBwbGllZCwgYnV0IEkgbm93DQpyZWFsaXplIHRo
YXQgSSBzaG91bGQgaGF2ZSBhbHNvIHRlc3RlZCBpdCBhZ2FpbnN0IHRoZSBhY3R1YWwgdXNlcnNw
YWNlDQp0b29saW5nIHRvIHZhbGlkYXRlIEFCSSBjb21wYXRpYmlsaXR5IOKAlCB3aGljaCBJIGRp
ZG7igJl0IGRvLiBUaGF0IHdhcyBhDQptaXNzIG9uIG15IHBhcnQuDQoNClRoYW5rcyBmb3IgdGhl
IHJldmlldyBhbmQgdGhlIGd1aWRhbmNlLiBJ4oCZbGwgZml4IHRoZSBwYXRjaCB0byBwcmVzZXJ2
ZQ0Kc3RydWN0dXJlIHNpemVzIGFuZCBlbnN1cmUgc2FmZSBudWxsIHRlcm1pbmF0aW9uIHdpdGhv
dXQgYnJlYWtpbmcgdGhlDQpBQkkg4oCUIGxpa2VseSBieSB1c2luZyBzdHJzY3B5KCkgd2l0aCBz
aXplIC0gMSBhbmQgc2V0dGluZyB0aGUgbGFzdA0KYnl0ZSBleHBsaWNpdGx5IGlmIG5lZWRlZC4N
Cg0KQXBvbG9naWVzIGZvciB0aGUgb3ZlcnNpZ2h0Lg0KDQpSZWdhcmRzDQpQcmFuYXYgVHlhZ2kN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMt
ZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vi
c2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9y
Zwo=
