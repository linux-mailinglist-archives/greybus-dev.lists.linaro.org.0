Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 594D6A079D2
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jan 2025 15:55:07 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7C16144A2A
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jan 2025 14:55:06 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	by lists.linaro.org (Postfix) with ESMTPS id 860193EC51
	for <greybus-dev@lists.linaro.org>; Thu,  9 Jan 2025 14:54:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=ahfKItKo;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.161.47 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5f4cc48ab37so333139eaf.1
        for <greybus-dev@lists.linaro.org>; Thu, 09 Jan 2025 06:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1736434476; x=1737039276; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5VULE0UjHIqRlagW/OYJxPj5F0JvqA3RxB6BIakMShg=;
        b=ahfKItKohtfj3O14JpOU98pMQbnk4fiWbQ21zDNDgh1PnvGHkiY/a/bwmTxXgtxcXD
         YmblHGL00NHvqSQd3AxGv31cNTLnYWlAqNuHPVcvdgMKaeZYAefggXf4aHDV4KCITfEc
         3i/pORY3GQhVjG8dJWVkwm+zHEmOyFeidsES0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736434476; x=1737039276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5VULE0UjHIqRlagW/OYJxPj5F0JvqA3RxB6BIakMShg=;
        b=buY0QoVST57BYNLcp8jhI6qeALRSy49G+QmtkDrpJBgde7Q77i2eIEXPoRJA1Hto+L
         TVB60cYa89iw5V6kxpNdApX3XfgHFQhCfPcBf5ly+aZEqc9m7500YKA3St46ZMgxEovR
         Tv679+gCRe+oTkWqdx5AvzJxx3C0G59Zw5R4iXSn1qceAJR/BlPoGrAwJyRx4osNu0AI
         FITi5cG7cDMCpH7BsE15Fxp+zKYT2jBp4kP4NqEgstLgfmWdVhK3BKHNg3sSoc2Rb/KV
         yDiJTJpjQmXOKDlfX1RRdH7qMklPlSzkHlECFFtukjuV5P1YcPmOtIFistPzvWYRmTfL
         K7iA==
X-Forwarded-Encrypted: i=1; AJvYcCW/L0+lAR6wtBViJB/u2wwstud8/aTz+VQCFfKnj3GHqT/meICTD5hkbY+MyMVR3nrSHpICS71dLE8NRw==@lists.linaro.org
X-Gm-Message-State: AOJu0YxPjcskxLwdCgJFXh1u6GT0tEaSvAzGc+Y5zV3Hru4Oh3Zn8bKY
	BBVT/ykoK5Vy+uAJBWNDrOV3fIfcpE0jRkwSLZTivUYgIJuuE8sGn6seb2idQg==
X-Gm-Gg: ASbGncuhzCk/lpzVfbAHBqHwvw1zNErhXaufRbXVxVKtzAc1bqV+qPuJRD3W0WQVUiJ
	iybIzwHdNAg/XKjwGM6FSEFlXQ1iFiYmp43iHwXP3TjCxMTcAIUH0UT4bK6mg9ZmU4+VfGaOcTg
	+k2CCNh80bZfD6UH1xUtT4691K91kP/bqPiQIWsbJmz27BnaTeUMOq6hEFrX5CP09dnQA9IT99M
	2IhGt5cbeJo8excygVzKTyjlesgw9vq5n6q7Ia68LWYGeIGPkD1u0YGkI3DvWYZQrK2ynX8XEn8
	TKSPgVTVgo8R8wQ=
X-Google-Smtp-Source: AGHT+IGX2grguxXy8gLo4Q2N5Rw0zTtUivQW6kIzq7+qZBHhu/OTKNSPcrnL7pgVNEyxcTF+JDsc/Q==
X-Received: by 2002:a05:6870:b9c7:b0:29e:69d9:8834 with SMTP id 586e51a60fabf-2aa0609b208mr3769848fac.0.1736434474369;
        Thu, 09 Jan 2025 06:54:34 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-2ad8059e39esm350832fac.31.2025.01.09.06.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 06:54:33 -0800 (PST)
Message-ID: <46653b18-42b1-4511-afad-4f5a15e2fceb@ieee.org>
Date: Thu, 9 Jan 2025 08:54:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <20250109003624.37323-1-iron.will.walsh@gmail.com>
 <ed70a5d5-8e85-495b-9e56-eae472ba3046@ieee.org>
 <dcf6ec9f-39f2-4729-9250-14eb4d8d2adb@stanley.mountain>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <dcf6ec9f-39f2-4729-9250-14eb4d8d2adb@stanley.mountain>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 860193EC51
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.59 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.99)[99.95%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[209.85.161.47:from];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.161.47:from];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[]
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZMLTO3ZYLHSTM7C7ERDE6ERROJEIMVXU
X-Message-ID-Hash: ZMLTO3ZYLHSTM7C7ERDE6ERROJEIMVXU
X-Mailman-Approved-At: Thu, 09 Jan 2025 14:55:01 +0000
CC: Will Walsh <iron.will.walsh@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: remove unnecessary parentheses
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZMLTO3ZYLHSTM7C7ERDE6ERROJEIMVXU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMS85LzI1IDE6NDUgQU0sIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+IE9uIFdlZCwgSmFuIDA4
LCAyMDI1IGF0IDA4OjU2OjUwUE0gLTA2MDAsIEFsZXggRWxkZXIgd3JvdGU6DQo+PiBPbiAxLzgv
MjUgNjozNiBQTSwgV2lsbCBXYWxzaCB3cm90ZToNCj4+PiBVbm5lY2Vzc2FyeSBwYXJlbnRoZXNl
cyBpbiBib29sZWFuIGNvbXBhcmlzb25zIG1ha2UgaXQgaGFyZGVyIHRvIHJlYWQuDQo+Pj4NCj4+
PiBSZW1vdmVkIHRoZSBleHRyYSBwYXJlbnRoZXNlcyBvbiBsaW5lIDMwNSBmb3IgY29kZSByZWFk
YWJpbGl0eS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFdpbGwgV2Fsc2ggPGlyb24ud2lsbC53
YWxzaEBnbWFpbC5jb20+DQo+Pg0KPj4gSSdtIG5vdCBzdXJlIHRoaXMgbWFrZXMgYSBiaWcgZGlm
ZmVyZW5jZSBpbiByZWFkYWJpbGl0eSBidXQgSQ0KPj4gcGVyc29uYWxseSBhdm9pZCBleHRyYSBw
YXJlbnRoZXNlcyB1bmxlc3MgYWRkaW5nIHRoZW0gbWFrZXMgYQ0KPj4gY29tcGlsZXIgd2Fybmlu
ZyBnbyBhd2F5Lg0KPiANCj4gSXQncyBub3QgYSBjb21waWxlciB3YXJuaW5nLCBpdCBjaGVja3Bh
dGNoLg0KDQpJIG1lYW50IGNvbXBpbGVyICItV3BhcmVudGhlc2VzIiB3YXJuaW5ncywgbGlrZSAi
c3VnZ2VzdA0KcGFyZW50aGVzZXMgYXJvdW5kIOKAmCvigJkgaW5zaWRlIOKAmDw84oCZIi4NCg0K
QnV0IGFueXdheSwgSSBoYXZlIG5vIHByb2JsZW0gd2l0aCB0aGlzIGJlaW5nIHJlamVjdGVkLA0K
aXQgZG9lc24ndCByZWFsbHkgYWRkIHZhbHVlLCBhbmQgdG8gc29tZSwgaXQgc3VidHJhY3RzLg0K
DQoJCQkJCS1BbGV4DQoNCj4gDQo+IHJlZ2FyZHMsDQo+IGRhbiBjYXJwZW50ZXINCj4gDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2
IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2Ny
aWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
