Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9336B75498B
	for <lists+greybus-dev@lfdr.de>; Sat, 15 Jul 2023 17:04:43 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 86EF344155
	for <lists+greybus-dev@lfdr.de>; Sat, 15 Jul 2023 15:04:42 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	by lists.linaro.org (Postfix) with ESMTPS id 1A05B3E948
	for <greybus-dev@lists.linaro.org>; Sat, 15 Jul 2023 15:04:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b="YTV0XX5/";
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.41 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-77a62a84855so119748639f.1
        for <greybus-dev@lists.linaro.org>; Sat, 15 Jul 2023 08:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1689433475; x=1692025475;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lmHuW7kv0xV4VT3dumqkXFfTsOFC3icy4KTiLxdmbE=;
        b=YTV0XX5/LjVqIw+XoXG35FlvNF6M6nmuwYCHJqV89vyQgx7oSj3XynMq3PWrKuPs8s
         31oqRjJczQzQUU7E+GL/Pqwy2TpLq8zfVZVp7E5ePmpApR8Qcmxw0zX6ZV6w0nk45gAe
         OEhWaxT+/7n09BGFgFUAydDE6FsvXtHpCZ9aE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689433475; x=1692025475;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7lmHuW7kv0xV4VT3dumqkXFfTsOFC3icy4KTiLxdmbE=;
        b=c9VCoOZ0uIRSfWD9IyBfBy9j5z2kufD0BcIj4TKOafQHHNcINvvbAIoi6McKr6kW/N
         nZxDLdvN3vZUDYj7xsbQTz0/bbtsUd1yODAJWkzUoTxdW0tUlKOxUXavp6AomAPnl3Zb
         XHZ8esXk/UWJ4f4znNQfF2JNsS/eLcFNLzafBWMWnDlyiBPNCFMFzIV/qzeSBbdpJICw
         egi4cWNGcBvp6wbTLh+X3x8YZJ+krf5oV7wCIGf5RbWe9DbyFQ220wRBJ0XIpDowsCZ8
         NHaMV352uqmMQr4/EMkB0U+UeZ8mboDBCU0k5DoN70WZWq4J+5Yma+Vi5gO3lzu4Ma4p
         v7KQ==
X-Gm-Message-State: ABy/qLbXJ8nV3+cou3m6czWDou6YhcmCmjWbXow5Bu8ktaFW/BPeSAGs
	+H120NDkJBYAguClea4KbDEgCQ==
X-Google-Smtp-Source: APBJJlGCHBR18RbqKTwOEfeQCS+sObjJ7YyFJMDRWSnlpsu4VZf0cz4VlODNl7iJszbyGz8zihBZwQ==
X-Received: by 2002:a5e:a811:0:b0:783:69e0:57a7 with SMTP id c17-20020a5ea811000000b0078369e057a7mr7171574ioa.16.1689433475484;
        Sat, 15 Jul 2023 08:04:35 -0700 (PDT)
Received: from [10.211.55.3] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id x3-20020a6bfe03000000b0077e40979b41sm3448036ioh.45.2023.07.15.08.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 08:04:34 -0700 (PDT)
Message-ID: <58c62051-86b1-b0fe-5e96-8594561ce881@ieee.org>
Date: Sat, 15 Jul 2023 10:04:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230714201622.2490792-1-u.kleine-koenig@pengutronix.de>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20230714201622.2490792-1-u.kleine-koenig@pengutronix.de>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1A05B3E948
X-Spamd-Bar: -------------
X-Spamd-Result: default: False [-13.00 / 15.00];
	REPLY(-4.00)[];
	DWL_DNSWL_HI(-3.50)[ieee.org:dkim];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	RCVD_IN_DNSWL_HI(-0.50)[209.85.166.41:from];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	URIBL_BLOCKED(0.00)[linaro.org:email,pengutronix.de:email];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.41:from];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_IN_DNSWL_FAIL(0.00)[98.61.227.136:server fail];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[ieee.org:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[]
Message-ID-Hash: CMWVHNGRNWPKQMRFPYCULD2KDAAKVPM5
X-Message-ID-Hash: CMWVHNGRNWPKQMRFPYCULD2KDAAKVPM5
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: pwm: Drop unused member from driver struct
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CMWVHNGRNWPKQMRFPYCULD2KDAAKVPM5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gNy8xNC8yMyAzOjE2IFBNLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToNCj4gVGhlIGRyaXZl
ciBkb2Vzbid0IG1ha2UgdXNlIG9mIHN0cnVjdCBnYl9wd21fY2hpcDo6cHdtLiBTbyB0aGF0IHN0
cnVjdA0KPiBtZW1iZXIgY2FuIGp1c3QgYmUgZHJvcHBlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+DQo+IC0t
LQ0KPiAgIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5jIHwgMSAtDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9wd20uYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5jDQo+IGluZGV4IDg4
ZGExZDc5NmYxMy4uZjU2OWQzNzFhMDA3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9wd20uYw0KPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20uYw0KPiBA
QCAtMTksNyArMTksNiBAQCBzdHJ1Y3QgZ2JfcHdtX2NoaXAgew0KPiAgIAl1OAkJCXB3bV9tYXg7
CS8qIG1heCBwd20gbnVtYmVyICovDQo+ICAgDQo+ICAgCXN0cnVjdCBwd21fY2hpcAkJY2hpcDsN
Cj4gLQlzdHJ1Y3QgcHdtX2NoaXAJCSpwd207DQo+ICAgfTsNCj4gICANCj4gICBzdGF0aWMgaW5s
aW5lIHN0cnVjdCBnYl9wd21fY2hpcCAqcHdtX2NoaXBfdG9fZ2JfcHdtX2NoaXAoc3RydWN0IHB3
bV9jaGlwICpjaGlwKQ0KPiANCj4gYmFzZS1jb21taXQ6IDA2YzJhZmI4NjJmOWRhOGRjNWVmYTRi
NjA3NmEwZTQ4YzNmYmFhYTUNCg0KTG9va3MgZ29vZC4NCg0KUmV2aWV3ZWQtYnk6IEFsZXggRWxk
ZXIgPGVsZGVyQGxpbmFyby5vcmc+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBs
aXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1k
ZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
