Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FD7BDA051
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Oct 2025 16:33:46 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 59B1645608
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Oct 2025 14:33:45 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	by lists.linaro.org (Postfix) with ESMTPS id 96EF14447C
	for <greybus-dev@lists.linaro.org>; Tue, 14 Oct 2025 14:01:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=S6wh1PJ9;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of vivek.balachandhar@gmail.com designates 209.85.219.54 as permitted sender) smtp.mailfrom=vivek.balachandhar@gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-7970e8d1cfeso97365016d6.1
        for <greybus-dev@lists.linaro.org>; Tue, 14 Oct 2025 07:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760450499; x=1761055299; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LS/tbUNJsSKY6ZBKj3q4etRpyWDlKJg9S7gh6A/LQgo=;
        b=S6wh1PJ9fBO1QCKNWh/kgErL7rTl9wOBwutnKH37AwSdZx3DPrDhVmtL5SJ8/f+Aul
         qZGh4uTKeLMQtzvM0F0/WBswByXHkVD4SjGj9ouOezeld3ie9lcqmNMEIcBWxHluG36S
         LQWZEWyio2GX5l46rBfKscmWp0PALEV7+7Ep+9dZfj08qZdQ5ql4E8Dfo0UULqMbstY+
         /96vN7KgMY73mFPzm6Q+gkt43lcPMpSn3ledEblB3uJlXi58MMsANGG9v9GZCXqwPBYv
         ovGWkiu/p/ogkmvt6V11wj4TpvLlr4IV3XjNjTI+dXBBwXSz4eKkVUJEasmL/D9+4mMC
         b4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760450499; x=1761055299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LS/tbUNJsSKY6ZBKj3q4etRpyWDlKJg9S7gh6A/LQgo=;
        b=t2JJpqAPIcgh5mQlpfRg4GnOnCtAHXHlnf77SDHlAKlJ6iMAqCRpLaTwkSj+BYZ1My
         oqQPpA9W8rYxhZSxkhbTNs74dYW6ndz4gePOC7iCyt2mn2PbkpoCM3lBmBfLvOedQyap
         5v25a3tqgnDsf7r4N5y8H7tPWU2rF2Wip+3WHe9RmtTFpOZKRrurix7bp7ClgVCBJ5mt
         NdHxTdJObgr1ymMsl51VlXzzMXPBBxMMm919vy1hQtW9fqICkTHaum8/NRjE3xHAfAlj
         AumnagYXirpVQrkHUkeDsjydSuZuWhaGvmGuz/Zj0L81ZB0dHWA1GmUJ9gOkxn7qBWa0
         T3jw==
X-Forwarded-Encrypted: i=1; AJvYcCV0tCyzoaKqYOYGoNG55aT3Zwen9IuBkGoTvTOv/mwkS2eFY61Epm9CemAAcQGvPEfyFmpzrOvPHEoYrQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YwawkTZkSLNQKW+0NXyczKv+pe8eUq+1/4JYR5IHBNbHFtMSJSe
	uNvGQec8VuWBEhQbxXAWfwYXYEEzHXY7AX/PpzFz5Tb1Mua8wuIFYLv7
X-Gm-Gg: ASbGncvtdu6aLtwnO8XzblAFsfJaoiV4V/TLirKm/6MRVYh3D6tdoQncHU1taGGBm2b
	jqbuLBt45Bzozvun11ADWi8H5bptfPv2tqhVfbnvwV2AxUde8I+gMWM4dRtBMgV5uzBvedp9Hll
	Erui/P0gY6ox88dBwWYXxOUO7SKX0sXBazeOqaERbvTKnuVpPUolacyFldzs0yMxvZf3udrBxdn
	27qjUJDUWR6B6nC3p1Y9XOGHgV+Pb4Lp5dQphl3mQk/O8G9SLjvNA1c2CGWrr7hhrqisNe8P7by
	BADpYnnlhNMb81fUDxRsem3UiSaOMhOQgtHDBXsYzBa8RuN9jU43J8GRXJbrLb0zsz427u+lP6z
	XBAKpjSfHUda19sM4GG6q2P9/uselrd+M75DDR9R2Upm9o8Polafdpr6shjaE64rNKP3KJ/Axsj
	hbJfk=
X-Google-Smtp-Source: AGHT+IFLWmAN9G07TTGLUzgifyDJgAAk5U/8bI9uGvO0YQEdEpRvVcRB55hOrODs3UAIlksFawlP9Q==
X-Received: by 2002:a05:6214:1c0c:b0:802:3d9c:4450 with SMTP id 6a1803df08f44-87b21032734mr363621256d6.19.1760450498747;
        Tue, 14 Oct 2025 07:01:38 -0700 (PDT)
Received: from [192.168.0.155] ([170.10.253.128])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc35ad1b7sm92609116d6.58.2025.10.14.07.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 07:01:30 -0700 (PDT)
Message-ID: <8918310c-d0aa-4e02-b9d4-9aac98b0a48f@gmail.com>
Date: Tue, 14 Oct 2025 10:01:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <20251014134148.2597178-1-vivek.balachandhar@gmail.com>
 <aO5VvrKTswmfO-n9@stanley.mountain>
Content-Language: en-CA
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
In-Reply-To: <aO5VvrKTswmfO-n9@stanley.mountain>
X-Rspamd-Queue-Id: 96EF14447C
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.219.54:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: vivek.balachandhar@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: SDSFKWWCRUMRHXXTYPECLQTPIWAFLQG3
X-Message-ID-Hash: SDSFKWWCRUMRHXXTYPECLQTPIWAFLQG3
X-Mailman-Approved-At: Tue, 14 Oct 2025 14:33:37 +0000
CC: johan@kernel.org, elder@kernel.org, schopin@ubuntu.com, me@abhy.me, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: documentation: replace strncpy() with strscpy_pad()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SDSFKWWCRUMRHXXTYPECLQTPIWAFLQG3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

WWVzLCBEYW4uIE5pY2UgY2F0Y2guIEJ1aWxkaW5nIGl0IHdpdGggYmVsb3cgc2FtcGxlIGNoYW5n
ZToNCg0KbWVtc2V0KCZpbnRmX2xvYWQuZmlybXdhcmVfdGFnLCAwLCBHQl9GSVJNV0FSRV9VX1RB
R19NQVhfU0laRSk7DQpzdHJuY3B5KChjaGFyICopJmludGZfbG9hZC5maXJtd2FyZV90YWcsIGZp
cm13YXJlX3RhZywNCiDCoCDCoCDCoCDCoCBHQl9GSVJNV0FSRV9VX1RBR19NQVhfU0laRSAtIDEp
Ow0KDQpJZiBpdCB3b3Jrcywgd2lsbCBzZW5kIGFub3RoZXIgcGF0Y2guDQoNCkJlc3QsIFZpdmVr
Lg0KDQoNCk9uIDIwMjUtMTAtMTQgOTo1MyBhLm0uLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0KPiBP
biBUdWUsIE9jdCAxNCwgMjAyNSBhdCAwMTo0MTo0OFBNICswMDAwLCBWaXZlayBCYWxhY2hhbmRo
YXJUTiB3cm90ZToNCj4+IHN0cm5jcHkoKSBkb2VzIG5vdCBndWFyYW50ZWUgTlVMLXRlcm1pbmF0
aW9uIGFuZCBpcyBkZXByZWNhdGVkIGZvcg0KPj4gTlVMLXRlcm1pbmF0ZWQgc3RyaW5ncy4gUmVw
bGFjZSBpdCB3aXRoIHN0cnNjcHlfcGFkKCksIHdoaWNoIGd1YXJhbnRlZXMNCj4+IE5VTC10ZXJt
aW5hdGlvbiBhbmQgemVyby1wYWRzIHRoZSByZW1haW5pbmcgYnl0ZXMsIG1hdGNoaW5nIHRoZSBm
aXhlZC1zaXplDQo+PiBmaXJtd2FyZSB0YWcgc2VtYW50aWNzLg0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IFZpdmVrIEJhbGFjaGFuZGhhclROIDx2aXZlay5iYWxhY2hhbmRoYXJAZ21haWwuY29tPg0K
Pj4gLS0tDQo+PiAgIC4uLi9ncmV5YnVzL0RvY3VtZW50YXRpb24vZmlybXdhcmUvZmlybXdhcmUu
YyAgICAgICAgfCAxMiArKysrKystLS0tLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvRG9jdW1lbnRhdGlvbi9maXJtd2FyZS9maXJtd2FyZS5jIGIvZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvRG9jdW1lbnRhdGlvbi9maXJtd2FyZS9maXJtd2FyZS5jDQo+PiBpbmRl
eCAzYjM1ZWY2ZDRhZGIuLmRlYWM4NTg0ODQxYiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL0RvY3VtZW50YXRpb24vZmlybXdhcmUvZmlybXdhcmUuYw0KPj4gKysrIGIv
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvRG9jdW1lbnRhdGlvbi9maXJtd2FyZS9maXJtd2FyZS5j
DQo+IFRoaXMgaXMgc2FtcGxlIHVzZXIgc3BhY2UgY29kZSBzbyB0aGUgc3Ryc2NweV9wYWQoKSBp
c24ndCBhdmFpbGFibGUuICBJdA0KPiB3aWxsIGJyZWFrIHRoZSBjb21waWxlLg0KPg0KPiByZWdh
cmRzLA0KPiBkYW4gY2FycGVudGVyDQo+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZA
bGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMt
ZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
