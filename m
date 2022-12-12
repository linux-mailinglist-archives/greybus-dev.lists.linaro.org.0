Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7EC64AA2A
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Dec 2022 23:24:06 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6EB043EE7B
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Dec 2022 22:24:05 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	by lists.linaro.org (Postfix) with ESMTPS id 135F93E925
	for <greybus-dev@lists.linaro.org>; Mon, 12 Dec 2022 22:24:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=FR5uzaSN;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.175 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-il1-f175.google.com with SMTP id s16so4149599iln.4
        for <greybus-dev@lists.linaro.org>; Mon, 12 Dec 2022 14:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hbI+eTGIdrI44DmtbX1jGggNI5qyceGBZZvlSfYrIBA=;
        b=FR5uzaSNqtW4BhsAfYoxqJfqhcBjj3mMuZjOKAlK69RogWesOobPhr98bbCHFUes57
         XdQ2EaJ2hK0uuGQN6sb8YNS0IEtY+t2Qu31+uETU8R7VR8w3cG+3b0TDEt02sPNJdl8S
         qdvJzL4Bv6iYy+gBySf/XmATE+Sre+hXCO4yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hbI+eTGIdrI44DmtbX1jGggNI5qyceGBZZvlSfYrIBA=;
        b=jloIx0Klry0g53LakXjTlDoUXvBJhnuanK/EMtJlgNtlQYK8FQ9UbpGvZGYAx7iz4D
         pmKWEoNVmf84To26rGvT62VYsPSkkIATq5EF5gXaczD6BVfrUi+/icBKNhQH3ScpaGs1
         mZg4axQvyNI4L9Uef4QLAwcEQd2HDb5cgP1u9Jh/ohMu8YIiZ7MWUxHHeshiheNfcgWJ
         YCnnMvh9Kq/3jZscdTHvyHB19JtDJgKANo1mMZaQ56OSC997BhOD/LXxStjlKvo9zyep
         Jtm4fTr2PIYT0diP65cme/LoK+YRXKYtbM5oSxNDJomRWM+P9BIL/tRBjmfFvj7kdKdO
         QaRA==
X-Gm-Message-State: ANoB5pneKO7OUHgzOIZtglKDRqvB5frlKk7vUKrySF3JSoh9c7GVuHns
	SGHIuo3L5Uhr9p/dFUDKs5CUSQ==
X-Google-Smtp-Source: AA0mqf5cSTNIT7zNjXUgRRD66Jm0gkJcL/A796s5cGYTZ42sxUx2f6E6mcw+xXfeaHof+SH4A6Sibg==
X-Received: by 2002:a05:6e02:106f:b0:303:3ba0:1eeb with SMTP id q15-20020a056e02106f00b003033ba01eebmr8716815ilj.7.1670883841417;
        Mon, 12 Dec 2022 14:24:01 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id b18-20020a92db12000000b002f9b55e7e92sm3302440iln.0.2022.12.12.14.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 14:24:00 -0800 (PST)
Message-ID: <22fea66a-5b37-59ad-fa05-8caf75a9b539@ieee.org>
Date: Mon, 12 Dec 2022 16:24:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20221212221315.3778788-1-u.kleine-koenig@pengutronix.de>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20221212221315.3778788-1-u.kleine-koenig@pengutronix.de>
X-Rspamd-Queue-Id: 135F93E925
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_TO(0.00)[pengutronix.de,gmail.com,animalcreek.com,kernel.org,linuxfoundation.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.175:from]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: CXTUMVWOWTT6R6TPK7VOQ7GHCKRGPNCB
X-Message-ID-Hash: CXTUMVWOWTT6R6TPK7VOQ7GHCKRGPNCB
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: codecs: Drop empty platform remove function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CXTUMVWOWTT6R6TPK7VOQ7GHCKRGPNCB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMTIvMTIvMjIgNDoxMyBQTSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IEEgcmVtb3Zl
IGNhbGxiYWNrIGp1c3QgcmV0dXJuaW5nIDAgaXMgZXF1aXZhbGVudCB0byBubyByZW1vdmUgY2Fs
bGJhY2sNCj4gYXQgYWxsLiBTbyBkcm9wIHRoZSB1c2VsZXNzIGZ1bmN0aW9uLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25p
eC5kZT4NCg0KSSBhZ3JlZSwgdGhpcyBsb29rcyBnb29kIHRvIG1lLg0KDQpSZXZpZXdlZC1ieTog
QWxleCBFbGRlciA8ZWxkZXJAbGluYXJvLm9yZz4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5jIHwgNiAtLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwg
NiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9hdWRpb19jb2RlYy5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYw0K
PiBpbmRleCAwYWQ4YWVhYmNjYmYuLjcyYWNlNzRlYTYwNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYw0KPiArKysgYi9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9hdWRpb19jb2RlYy5jDQo+IEBAIC0xMDc1LDExICsxMDc1LDYgQEAgc3RhdGljIGlu
dCBnYmF1ZGlvX2NvZGVjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAg
CQkJZ2JhdWRpb19kYWksIEFSUkFZX1NJWkUoZ2JhdWRpb19kYWkpKTsNCj4gICB9DQo+ICAgDQo+
IC1zdGF0aWMgaW50IGdiYXVkaW9fY29kZWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQo+IC17DQo+IC0JcmV0dXJuIDA7DQo+IC19DQo+IC0NCj4gICBzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBncmV5YnVzX2Fzb2NfbWFjaGluZV9vZl9tYXRjaFtdICA9IHsN
Cj4gICAJeyAuY29tcGF0aWJsZSA9ICJ0b3NoaWJhLGFwYi1kdW1teS1jb2RlYyIsIH0sDQo+ICAg
CXt9LA0KPiBAQCAtMTA5NCw3ICsxMDg5LDYgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2
ZXIgZ2JhdWRpb19jb2RlY19kcml2ZXIgPSB7DQo+ICAgCQkub2ZfbWF0Y2hfdGFibGUgPSBncmV5
YnVzX2Fzb2NfbWFjaGluZV9vZl9tYXRjaCwNCj4gICAJfSwNCj4gICAJLnByb2JlID0gZ2JhdWRp
b19jb2RlY19wcm9iZSwNCj4gLQkucmVtb3ZlID0gZ2JhdWRpb19jb2RlY19yZW1vdmUsDQo+ICAg
fTsNCj4gICBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKGdiYXVkaW9fY29kZWNfZHJpdmVyKTsNCj4g
ICANCj4gDQo+IGJhc2UtY29tbWl0OiA4MzBiM2M2OGMxZmIxZTkxNzYwMjhkMDJlZjg2ZjNjZjc2
YWEyNDc2DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3Jn
ClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMu
bGluYXJvLm9yZwo=
