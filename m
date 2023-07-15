Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C706C75498D
	for <lists+greybus-dev@lfdr.de>; Sat, 15 Jul 2023 17:04:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D92F044155
	for <lists+greybus-dev@lfdr.de>; Sat, 15 Jul 2023 15:04:53 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	by lists.linaro.org (Postfix) with ESMTPS id 8F3CC3E948
	for <greybus-dev@lists.linaro.org>; Sat, 15 Jul 2023 15:04:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=Dq890GHu;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.42 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-78374596182so126011739f.0
        for <greybus-dev@lists.linaro.org>; Sat, 15 Jul 2023 08:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1689433487; x=1692025487;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8gOGWAD6wBVovUk2BHvSqIfOjzXSeVMRftgvw0qpfvg=;
        b=Dq890GHuhMH3ZbDuB9bZXTLcJD42Y7MTkD+Fb+3WQZMCsN4S7EW/o8q/zy8vwm1ewH
         2WkvXs/uUU5MO+7s5tdCYy4R3zwhpiOhhGqAdRIClaywsmn8BLqJ+kFswcWpdylW3Acc
         9+WnXhEzLih006uvdqL9Mpf+JT/dQS0WEP7V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689433487; x=1692025487;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8gOGWAD6wBVovUk2BHvSqIfOjzXSeVMRftgvw0qpfvg=;
        b=TIiWH7Xozc12nIxBLaTz+JgAO5sjHRO4iLZRPV+EM5Qv8Wxq4tgroORmSX8rcwE26i
         yOZJUxy5iNHvfWs6SQEh/bX9zAvKnrKt42Odfq/WCnrvbacLUf5okE4Xpzl2L/V4kr4J
         OiKScxOGPc49Xmgd5M52S2Ec6jm5r8MEBWPC3Bo5Wf36coMK1BUkJFE/wKCpJHqB8sV8
         BiSK61Uko9nkT1/gKKxw0hGAV1EiZTEJYhss9YolQG/l9GI0yj3LIqbYWXlVK+5MGvTF
         zQIp4Qmce+FkThnJ+Ki9Jjz4PzA8F0RcXr6KVUGQdHbCklp0d0+rfkEZnhP/yiuCjAhQ
         8Qcw==
X-Gm-Message-State: ABy/qLYz/iKjk8WcAXGrMWOdOFFdhwn9XPTeTwMy8t58jWVVZ5GEE7BS
	+yfSuV+5A+16stL6lXtUt9Tw1w==
X-Google-Smtp-Source: APBJJlFLQ3qqt+bf2ZY7TjorWA6fP5Mtk4I1NR6VlGwIKrAhe/fQRo9Dg0t06pQGdEpXhw8baAKnrg==
X-Received: by 2002:a6b:917:0:b0:77e:3e85:34ee with SMTP id t23-20020a6b0917000000b0077e3e8534eemr7761979ioi.13.1689433487040;
        Sat, 15 Jul 2023 08:04:47 -0700 (PDT)
Received: from [10.211.55.3] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id z16-20020a6b5c10000000b0076373f90e46sm3414217ioh.33.2023.07.15.08.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 08:04:46 -0700 (PDT)
Message-ID: <f8aec2a1-45ae-712f-db60-f923f2bf2a5b@ieee.org>
Date: Sat, 15 Jul 2023 10:04:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
 <20230714205623.2496590-11-u.kleine-koenig@pengutronix.de>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20230714205623.2496590-11-u.kleine-koenig@pengutronix.de>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8F3CC3E948
X-Spamd-Bar: ------------
X-Spamd-Result: default: False [-12.00 / 15.00];
	REPLY(-4.00)[];
	DWL_DNSWL_HI(-3.50)[ieee.org:dkim];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[98.61.227.136:received,209.85.166.42:from];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.42:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[ieee.org:+];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[linaro.org:email,pengutronix.de:email,ieee.org:dkim];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
Message-ID-Hash: U42CATXFRKOVGQ6EBUGJ6XBM4QT3HSMP
X-Message-ID-Hash: U42CATXFRKOVGQ6EBUGJ6XBM4QT3HSMP
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 10/10] staging: greybus: pwm: Consistenly name pwm_chip variables "chip"
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/U42CATXFRKOVGQ6EBUGJ6XBM4QT3HSMP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gNy8xNC8yMyAzOjU2IFBNLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToNCj4gQWxsIGZ1bmN0
aW9uIHBhcmFtZXRlcnMgb2YgdHlwZSBwb2ludGVyIHRvIHN0cnVjdCBwd21fY2hpcCBpbiB0aGlz
DQo+IGRyaXZlciBhcmUgY2FsbGVkIGNoaXAgd2hpY2ggaXMgYWxzbyB0aGUgdXN1YWwgbmFtZSBv
ZiBmdW5jdGlvbg0KPiBwYXJhbWV0ZXJzIGFuZCBsb2NhbCB2YXJpYWJsZXMgaW4gbW9zdCBvdGhl
ciBwd20gZHJpdmVycy4gRm9yIGNvbnNpc3RlbmN5DQo+IHVzZSB0aGUgc2FtZSBuYW1lIGZvciB0
aGUgbG9jYWwgdmFyaWFibGUgb2YgdGhhdCB0eXBlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCg0KTG9va3Mg
Z29vZCB0byBtZS4NCg0KUmV2aWV3ZWQtYnk6IEFsZXggRWxkZXIgPGVsZGVyQGxpbmFyby5vcmc+
DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMgfCAxMiArKysrKyst
LS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5jIGIvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMNCj4gaW5kZXggODhkYTFkNzk2ZjEzLi5jNDgzZTFm
MDczOGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5jDQo+ICsr
KyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5jDQo+IEBAIC0yNjcsNyArMjY3LDcgQEAg
c3RhdGljIGludCBnYl9wd21fcHJvYmUoc3RydWN0IGdicGh5X2RldmljZSAqZ2JwaHlfZGV2LA0K
PiAgIHsNCj4gICAJc3RydWN0IGdiX2Nvbm5lY3Rpb24gKmNvbm5lY3Rpb247DQo+ICAgCXN0cnVj
dCBnYl9wd21fY2hpcCAqcHdtYzsNCj4gLQlzdHJ1Y3QgcHdtX2NoaXAgKnB3bTsNCj4gKwlzdHJ1
Y3QgcHdtX2NoaXAgKmNoaXA7DQo+ICAgCWludCByZXQ7DQo+ICAgDQo+ICAgCXB3bWMgPSBremFs
bG9jKHNpemVvZigqcHdtYyksIEdGUF9LRVJORUwpOw0KPiBAQCAtMjk1LDEzICsyOTUsMTMgQEAg
c3RhdGljIGludCBnYl9wd21fcHJvYmUoc3RydWN0IGdicGh5X2RldmljZSAqZ2JwaHlfZGV2LA0K
PiAgIAlpZiAocmV0KQ0KPiAgIAkJZ290byBleGl0X2Nvbm5lY3Rpb25fZGlzYWJsZTsNCj4gICAN
Cj4gLQlwd20gPSAmcHdtYy0+Y2hpcDsNCj4gKwljaGlwID0gJnB3bWMtPmNoaXA7DQo+ICAgDQo+
IC0JcHdtLT5kZXYgPSAmZ2JwaHlfZGV2LT5kZXY7DQo+IC0JcHdtLT5vcHMgPSAmZ2JfcHdtX29w
czsNCj4gLQlwd20tPm5wd20gPSBwd21jLT5wd21fbWF4ICsgMTsNCj4gKwljaGlwLT5kZXYgPSAm
Z2JwaHlfZGV2LT5kZXY7DQo+ICsJY2hpcC0+b3BzID0gJmdiX3B3bV9vcHM7DQo+ICsJY2hpcC0+
bnB3bSA9IHB3bWMtPnB3bV9tYXggKyAxOw0KPiAgIA0KPiAtCXJldCA9IHB3bWNoaXBfYWRkKHB3
bSk7DQo+ICsJcmV0ID0gcHdtY2hpcF9hZGQoY2hpcCk7DQo+ICAgCWlmIChyZXQpIHsNCj4gICAJ
CWRldl9lcnIoJmdicGh5X2Rldi0+ZGV2LA0KPiAgIAkJCSJmYWlsZWQgdG8gcmVnaXN0ZXIgUFdN
OiAlZFxuIiwgcmV0KTsNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxp
bmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2
ZUBsaXN0cy5saW5hcm8ub3JnCg==
