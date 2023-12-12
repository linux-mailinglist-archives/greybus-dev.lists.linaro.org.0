Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F17380EED6
	for <lists+greybus-dev@lfdr.de>; Tue, 12 Dec 2023 15:31:06 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 46E143F029
	for <lists+greybus-dev@lfdr.de>; Tue, 12 Dec 2023 14:31:05 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	by lists.linaro.org (Postfix) with ESMTPS id 676333EF33
	for <greybus-dev@lists.linaro.org>; Tue, 12 Dec 2023 14:30:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=LE4rTwG5;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.215.180 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5c699b44dddso2832649a12.1
        for <greybus-dev@lists.linaro.org>; Tue, 12 Dec 2023 06:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702391458; x=1702996258; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fLxmEV46v22txwFa1AVF+a9kLvKBmUdsjhpPYXuqg68=;
        b=LE4rTwG5r7oiIS1j4c+mDl+ihx9tbsLS/WXyWJyoc1550kGmEXpPLTCmXikkKDSMoy
         sCLC7mdi8Cm6MqckA3Tx/p3OBlwsXr0k9so/W7OoCvkeTwqJwAxNAC/nYeskwFU47Afi
         +7QKEM2LMoj+oV7/NtMuVtUbf7G9Zqd3yMKp80+z59iwEwCm5Dg2uMdmaR2n+QmUTVRF
         RqM4SAP2FweBF/nMa+iO4bXxGhJ1V8Ayg7n0rsTVp73F4YFbf7EOAPgbaHtSfyOFVzuv
         52l0VI5ib0eeuMP+3EUdV/J39k7O+0nxPeVZDODnfmVzNsaccZahDcKQ8tn2Zo4JsZCx
         NCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391458; x=1702996258;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fLxmEV46v22txwFa1AVF+a9kLvKBmUdsjhpPYXuqg68=;
        b=RJK1UgN5kZhyLwrhvkW8ZluAtWjbsiSLGQfR/b7028Omif8XqamJzbpDKlGG+fTm1y
         FKOG3psBPXi3L05KSdqXQ5DrmcztrdN3H73EVFj5QR1sS7hIYwjlpc5HPwvopwVkk/wa
         k2Hri6ijViVCEolizehoKAd05oftkKsrRelbYI8pmiG1YUdgoLT8NWNlEsa4QW0E8geF
         RXZ9Lzd3267bnOs75iiTOxRqMSmFtao52VJvU8usq9g+cfxAS3Af68l6d5beQBVGExtg
         FV5BJmrknDX2vH5NrJFkkvIwDCQ/hNqcsv6qazFYMXaj2sKyKX1gnFUv5dYhxJggPiSB
         uqkQ==
X-Gm-Message-State: AOJu0YzEWa4W2teOy3jcqKd8PvaqvcoTqlhw/r5qT7csw8iA9BcceN36
	y0kSbDaKUgHEM1PTFvcxvsg=
X-Google-Smtp-Source: AGHT+IFL54CYdCheHswHgye1orgRAHKB3RtZKK/0Uf04FuiqrNkuXtBmj4FcrK3a7VUkrqr9FylNRQ==
X-Received: by 2002:a05:6a20:639e:b0:18f:97c:4f58 with SMTP id m30-20020a056a20639e00b0018f097c4f58mr2188874pzg.100.1702391458310;
        Tue, 12 Dec 2023 06:30:58 -0800 (PST)
Received: from ?IPV6:2406:3003:2007:229e:ac29:68d8:877:4f72? ([2406:3003:2007:229e:ac29:68d8:877:4f72])
        by smtp.gmail.com with ESMTPSA id s24-20020a632158000000b005c67ca3c2c2sm8115302pgm.21.2023.12.12.06.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 06:30:57 -0800 (PST)
Message-ID: <27e768dd-f752-40d8-b4e0-0be34eb1d409@gmail.com>
Date: Tue, 12 Dec 2023 20:00:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Alex Elder <elder@ieee.org>, greybus-dev@lists.linaro.org
References: <20231211065420.213664-1-ayushdevel1325@gmail.com>
 <20231211065420.213664-2-ayushdevel1325@gmail.com>
 <786e357b-df63-42bb-bc8a-b5fc8d6e9146@ieee.org>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <786e357b-df63-42bb-bc8a-b5fc8d6e9146@ieee.org>
X-Rspamd-Queue-Id: 676333EF33
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.09 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.180:from];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[mail-pg1-f180.google.com:rdns,mail-pg1-f180.google.com:helo];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: MLRTIFXAZKVTMJONFWVATTK2ZMTWIVHT
X-Message-ID-Hash: MLRTIFXAZKVTMJONFWVATTK2ZMTWIVHT
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, nm@ti.com, yujie.liu@intel.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH V2 1/1] greybus: gb-beagleplay: Remove use of pad bytes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MLRTIFXAZKVTMJONFWVATTK2ZMTWIVHT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiAxMi8xMi8yMyAxOTozMSwgQWxleCBFbGRlciB3cm90ZToNCj4gT24gMTIvMTEvMjMgMTI6
NTQgQU0sIEF5dXNoIFNpbmdoIHdyb3RlOg0KPj4gTWFrZSBnYi1iZWFnbGVwbGF5IGdyZXlidXMg
c3BlYyBjb21wbGlhbnQgYnkgbW92aW5nIGNwb3J0IGluZm9ybWF0aW9uIHRvDQo+PiB0cmFuc3Bv
cnQgbGF5ZXIgaW5zdGVhZCBvZiB1c2luZyBgaGVhZGVyLT5wYWRgIGJ5dGVzLg0KPj4NCj4+IEdy
ZXlidXMgSERMQyBmcmFtZSBub3cgaGFzIHRoZSBmb2xsb3dpbmcgcGF5bG9hZDoNCj4+IDEuIGxl
MTYgY3BvcnQNCj4+IDIuIGdiX29wZXJhdGlvbl9tc2dfaGRyIG1zZ19oZWFkZXINCj4+IDMuIHU4
ICptc2dfcGF5bG9hZA0KPj4NCj4+IEZpeGVzOiBlYzU1OGJiZmVhNjcgKCJncmV5YnVzOiBBZGQg
QmVhZ2xlUGxheSBMaW51eCBEcml2ZXIiKQ0KPj4gU2lnbmVkLW9mZi1ieTogQXl1c2ggU2luZ2gg
PGF5dXNoZGV2ZWwxMzI1QGdtYWlsLmNvbT4NCj4NCj4gSSB3b3VsZCBzYXkgdGhhdCB0aGlzIGlz
IGFuIGltcHJvdmVtZW50LCBidXQgSSB3aXNoIEkNCj4gaGFkIGEgYmV0dGVyIHBpY3R1cmUgaW4g
bWluZCBvZiBob3cgdGhpcyB3b3Jrcy7CoCBUaGUNCj4gaW5pdGlhbCBjb21taXQgcHJvdmlkZWQg
c29tZSBleHBsYW5hdGlvbiwgYnV0IGV2ZW4NCj4gdGhlcmUgaXQgdGFsa3MgYWJvdXQgdGhlICJD
QzEzNTIgKHJ1bm5pbmcgU1ZDIFplcGh5cg0KPiBhcHBsaWNhdGlvbikiIGFuZCB0aGF0IGxlYWRz
IG1lIHRvIHdvbmRlciBldmVuIGhvdw0KPiB0aGUgaGFyZHdhcmUgaXMgc3RydWN0dXJlZC7CoCAo
SSdtIG5vdCByZWFsbHkgYXNraW5nDQo+IHlvdSBmb3IgdGhpcyByaWdodCBub3csIGJ1dCB5b3Ug
aGF2ZSBhIHJlZmVyZW5jZSB0bw0KPiBzb21ldGhpbmcgdGhhdCBwcm92aWRlcyBzb21lIGJhY2tn
cm91bmQsIHlvdSBzaG91bGQNCj4gcHJvdmlkZSBpdCBmb3IgY29udGV4dC4pDQoNClllcywgSSBh
bSB0aGlua2luZyBvZiByZXZhbXBpbmcgdGhlIEJlYWdsZSBjb25uZWN0IGRvY3MgdG8gcmVmbGVj
dCB0aGUgDQpuZXcgYXJjaGl0ZWN0dXJlIHdpdGggc29tZSBjaGFydHMgYW5kIHByb3ZpZGUgYSBi
ZXR0ZXIgb3ZlcmFsbCBwaWN0dXJlLiANCkl0IGlzIHNvcmVseSBuZWVkZWQgYXQgdGhpcyBwb2lu
dC4NCg0KDQo+IEFub3RoZXIgZ2VuZXJhbCBjb21tZW50IGlzIHRoYXQgdGhlIHVzZSBvZiBIRExD
IHNlZW1zDQo+IGxpa2UgaXQgY291bGQgYmUgYSBtb3JlIGNsZWFybHkgc2VwYXJhdGVkIGxheWVy
IHRoYXQNCj4gY291bGQgYmUgdXNlZCBieSBvdGhlciBHcmV5YnVzIHByb3RvY29scyBvciBhcHBs
aWNhdGlvbnMuDQo+IE1heWJlIHRoYXQncyBvdmVya2lsbCwgYnV0IGl0IGlzIGEgZGlzdGluY3Qg
bGF5ZXIsIHJpZ2h0Pw0KDQpJbml0aWFsIGNvbW1pdHMgb2YgZ2ItYmVhZ2xlcGxheSBkaWQgc2Vw
YXJhdGUgYWxsIHRoZSBIRExDIHBhcnRzIGZyb20gDQp0aGUgZHJpdmVyLiBIb3dldmVyLCBpdCB3
YXMgZGVjaWRlZCB0byBrZWVwIGl0IHRvZ2V0aGVyIGFuZCBtYXliZSANCmV4dHJhY3QgaXQgaW4g
dGhlIGZ1dHVyZSBpZiBvdGhlciBkcml2ZXJzIG5lZWQgaXQuDQoNCg0KPg0KPiBJIGhhZCBhIGNv
bW1lbnQgb3IgdHdvIGFib3V0IHVzaW5nICh2b2lkICopIGluc3RlYWQgb2YNCj4gKHU4ICopLCB0
byByZWR1Y2UgdGhlIG5lZWQgZm9yIGV4cGxpY2l0IHR5cGUgY2FzdHMuwqAgQnV0DQo+IEkgZm91
bmQgdGhhdCAodTggKikgaXMgdXNlZCBlbHNld2hlcmUgaW4gdGhlIEdyZXlidXMgY29kZS4NCj4N
Cj4gT25lIGNvbW1lbnQgSSAqd2lsbCogc2hhcmUgaXMgdGhhdCB0aGUgc2VyZGV2IFJYIGNhbGxi
YWNrDQo+IGhhcyBhIGNvbnN0IHJlY2VpdmUgYnVmZmVyLsKgIEkgcmVjb21tZW5kIHlvdSBwcmVz
ZXJ2ZSB0aGF0DQo+ICJjb25zdG5lc3MiIGluIHlvdXIgY29kZS4NCj4NCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLUFsZXgNCg0KVGhlIGNvbnN0bmVzcyBvZiB0aGUg
cmVjZWl2ZSBidWZmZXIgaXMgYWN0dWFsbHkgcHJlc2VydmVkLiBUaGUgDQpgZ2JfdHR5X3JlY2Vp
dmVgIGZ1bmN0aW9uIGNhbGxzIGBoZGxjX3J4YCAod2hpY2ggdGFrZXMgY29uc3QgdTggKikuIFRo
aXMgDQpmdW5jdGlvbiBjb3BpZXMgdGhlIGRhdGEgdG8gYSBzZXBhcmF0ZSBidWZmZXIgDQooYGdi
X2JlYWdsZXBsYXktPnJ4X2J1ZmZlcmApIGZvciBmdXJ0aGVyIHByb2Nlc3NpbmcuIFNvIHRoZSBj
b25zdCBkYXRhIA0KaXMgbm90IG1vZGlmaWVkLg0KDQoNCkF5dXNoIFNpbmdoDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxp
bmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNl
bmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
