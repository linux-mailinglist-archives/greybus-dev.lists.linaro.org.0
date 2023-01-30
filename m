Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 452FE680EDD
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 14:28:25 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 29BE2444C0
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 13:28:24 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lists.linaro.org (Postfix) with ESMTPS id C86D2444C0
	for <greybus-dev@lists.linaro.org>; Mon, 30 Jan 2023 13:28:17 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b="Aa4/xwVH";
	spf=pass (lists.linaro.org: domain of hdegoede@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=hdegoede@redhat.com;
	dmarc=pass (policy=none) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675085297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BAMPPrar8OAIvnPipq/Mby6BJP4m+tsjTfvNt2nu5yY=;
	b=Aa4/xwVHM3mm0p6hGV3WbjIAOYs7lc9whLts1MEucXhsXx1FkmcvR9nqZy4Z7qq4bm+FMd
	1hD8FheAlH52Rbi3+BZZoua8pCUJ8E1kuBVwKD9Zm3ou1AWwHMxb4KJgu9nU+ciKK1MwFr
	LbsPbzn1gPv3TQiVuvQBdT76OMSFX2Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-73-Bar3AurqPH6P16r0Fn_Lhw-1; Mon, 30 Jan 2023 08:28:16 -0500
X-MC-Unique: Bar3AurqPH6P16r0Fn_Lhw-1
Received: by mail-ej1-f71.google.com with SMTP id bj15-20020a170906b04f00b0088ac85a6fc1so663177ejb.1
        for <greybus-dev@lists.linaro.org>; Mon, 30 Jan 2023 05:28:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BAMPPrar8OAIvnPipq/Mby6BJP4m+tsjTfvNt2nu5yY=;
        b=gs8TkrwouDz2S/8EEhD32mvziztUSj1jhhNzfBzUy/PETS4rjDT7G4mPRS17weWleL
         DwLIFLRFc8YUVxDcRCYA9/M8Kc+Lm9+JZOFo0aPbaCB71A2I0k+KLSX+Z0PZ/BwPty3f
         RebjXXMFsreD4E8eswBZuDrqT40vRyY4QKkUcPVYyUIosRx1HDKFYuTzKLSlrdwNBVR2
         VD32OHFjg4V0OP87B/Nij8NrEsxlHDu1rKLo8zT+HtO1svst4el/pHp2qyaguRKiKbRV
         5OcsKUkPZtYKvA1FAfnCze4QTZVpuAe2w8YH7cHzVR2qUbX0+KklCOr4LRP1+ZtEsqiV
         zAoQ==
X-Gm-Message-State: AFqh2koxF0dhJtIzWjnvwwxO2MBFxO6KIsfyA4/SGkuvXUc/xbJdx4zn
	FFJEFXVWhJIR3leNitEQyYTPpwIGDGaTWTNa61z1Q5q87oqV3QaXzbGbaKZL0r3PYNZwOyUf2hQ
	4yhpH/vW+p4Zs3GTqnDLdwqWD
X-Received: by 2002:a17:907:6f18:b0:84d:4e4f:1f85 with SMTP id sy24-20020a1709076f1800b0084d4e4f1f85mr51466012ejc.59.1675085295108;
        Mon, 30 Jan 2023 05:28:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvkJUOVVr34vm+zmg/PWqvYKnlznq2hZ3URz42Cd9fuhjNyt2zqjNQQSbqM6nPUBQR5mwpvXA==
X-Received: by 2002:a17:907:6f18:b0:84d:4e4f:1f85 with SMTP id sy24-20020a1709076f1800b0084d4e4f1f85mr51465985ejc.59.1675085294943;
        Mon, 30 Jan 2023 05:28:14 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id kl13-20020a170907994d00b00882f9130eafsm3774140ejc.26.2023.01.30.05.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 05:28:14 -0800 (PST)
Message-ID: <b6eca5e1-2340-cd09-ede9-116350bca346@redhat.com>
Date: Mon, 30 Jan 2023 14:28:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>
References: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
 <0937b9a5-0caa-2a73-33c4-82e6cab02ef0@redhat.com>
 <20230130132620.3cmmq5ga3uebazwf@t-8ch.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230130132620.3cmmq5ga3uebazwf@t-8ch.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C86D2444C0
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:170.10.129.0/24];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,redhat.com,microsoft.com,riseup.net,linux.intel.com,gmail.com,linuxfoundation.org,vger.kernel.org,lists.sourceforge.net,lists.linaro.org,lists.linux.dev];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	ASN(0.00)[asn:30031, ipnet:170.10.128.0/23, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[170.10.129.124:from]
X-Rspamd-Action: no action
Message-ID-Hash: V36S6KR2LLRASXDWBUZNLT5BROT3FDGQ
X-Message-ID-Hash: V36S6KR2LLRASXDWBUZNLT5BROT3FDGQ
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Maximilian Luz <luzmaximilian@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Mark Gross <markgross@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/9] HID: Constify lowlevel HID drivers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/V36S6KR2LLRASXDWBUZNLT5BROT3FDGQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCk9uIDEvMzAvMjMgMTQ6MjYsIFRob21hcyBXZWnDn3NjaHVoIHdyb3RlOg0KPiBIaSBI
YW5zLA0KPiANCj4gT24gTW9uLCBKYW4gMzAsIDIwMjMgYXQgMDk6MzY6MzJBTSArMDEwMCwgSGFu
cyBkZSBHb2VkZSB3cm90ZToNCj4+IEhpLA0KPj4NCj4+IE9uIDEvMzAvMjMgMDQ6NTksIFRob21h
cyBXZWnDn3NjaHVoIHdyb3RlOg0KPj4+IFNpbmNlIDUyZDIyNTM0NjkwNCAoIkhJRDogTWFrZSBs
b3dsZXZlbCBkcml2ZXIgc3RydWN0cyBjb25zdCIpIHRoZQ0KPj4+IGxvd2xldmVsIEhJRCBkcml2
ZXJzIGFyZSBvbmx5IGV4cG9zZWQgYXMgY29uc3QuDQo+Pj4NCj4+PiBUYWtlIGFkdmFudGFnZSBv
ZiB0aGlzIHRvIGNvbnN0aWZ5IHRoZSB1bmRlcmx5aW5nIHN0cnVjdHVyZXMsIHRvby4NCj4+Pg0K
Pj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5l
dD4NCj4+DQo+PiBUaGFua3MsIHNlcmllcyBsb29rcyBnb29kIHRvIG1lOg0KPj4NCj4+IFJldmll
d2VkLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPg0KPj4NCj4+IEknbGwg
YWxzbyBwaWNrIHVwIC8gbWVyZ2UgcGF0Y2hlcyA3ICsgOCBpbnRvIHBkeDg2L2Zvci1uZXh0DQo+
PiBzb21ldGltZSB0aGlzIHdlZWsuDQo+IA0KPiBQbGVhc2Ugbm90ZSB0aGF0IHBhdGNoIDcgZGVw
ZW5kcyBvbiBjb21taXQgNTJkMjI1MzQ2OTA0DQo+ICgiSElEOiBNYWtlIGxvd2xldmVsIGRyaXZl
ciBzdHJ1Y3RzIGNvbnN0Iikgd2hpY2ggaXMgbm90IHlldCBpbiBMaW51cycNCj4gdHJlZSwgb25s
eSBpbiB0aGUgSElEIHRyZWUgKGJyYW5jaCBmb3ItNi4zL2hpZC1jb3JlKS4NCj4gDQo+IE1heWJl
IGl0J3MgYmV0dGVyIHRvIHRha2UgaXQgdmlhIHRoZSBISUQgdHJlZSBvciBJIGNhbiByZXNlbmQg
d2hlbiB0aGUNCj4gcHJlcmVxdWlzaXRlcyBhcmUgaW4gTGludXMnIHRyZWUuDQoNCkFoIHllcyB0
aGVuIGl0IHdvdWxkIGJlIGJldHRlciB0byB0YWtlIHRoZSBlbnRpcmUgc2V0IHRocm91Z2ggdGhl
IEhJRCB0cmVlLA0KaGVyZSBpcyBteSBhY2sgZm9yIHRoYXQ6DQoNClJldmlld2VkLWJ5OiBIYW5z
IGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPg0KDQpSZWdhcmRzLA0KDQpIYW5zDQoNCg0K
Pj4+IC0tLQ0KPj4+IFRob21hcyBXZWnDn3NjaHVoICg5KToNCj4+PiAgICAgICBISUQ6IGFtZF9z
Zmg6IENvbnN0aWZ5IGxvd2xldmVsIEhJRCBkcml2ZXINCj4+PiAgICAgICBISUQ6IGh5cGVydjog
Q29uc3RpZnkgbG93bGV2ZWwgSElEIGRyaXZlcg0KPj4+ICAgICAgIEhJRDogbG9naXRlY2gtZGo6
IENvbnN0aWZ5IGxvd2xldmVsIEhJRCBkcml2ZXINCj4+PiAgICAgICBISUQ6IHN0ZWFtOiBDb25z
dGlmeSBsb3dsZXZlbCBISUQgZHJpdmVyDQo+Pj4gICAgICAgSElEOiBpbnRlbC1pc2gtaGlkOiBD
b25zdGlmeSBsb3dsZXZlbCBISUQgZHJpdmVyDQo+Pj4gICAgICAgSElEOiBzdXJmYWNlLWhpZDog
Q29uc3RpZnkgbG93bGV2ZWwgSElEIGRyaXZlcg0KPj4+ICAgICAgIHBsYXRmb3JtL3g4NjogYXN1
cy10ZjEwM2MtZG9jazogQ29uc3RpZnkgbG93bGV2ZWwgSElEIGRyaXZlcg0KPj4+ICAgICAgIHBs
YXRmb3JtL3g4NjogYXN1cy10ZjEwM2MtZG9jazogQ29uc3RpZnkgdG9wcm93IGtleW1hcA0KPj4+
ICAgICAgIHN0YWdpbmc6IGdyZXlidXM6IGhpZDogQ29uc3RpZnkgbG93bGV2ZWwgSElEIGRyaXZl
cg0KPj4+DQo+Pj4gIGRyaXZlcnMvaGlkL2FtZC1zZmgtaGlkL2FtZF9zZmhfaGlkLmMgICAgICB8
IDIgKy0NCj4+PiAgZHJpdmVycy9oaWQvaGlkLWh5cGVydi5jICAgICAgICAgICAgICAgICAgIHwg
MiArLQ0KPj4+ICBkcml2ZXJzL2hpZC9oaWQtbG9naXRlY2gtZGouYyAgICAgICAgICAgICAgfCA0
ICsrLS0NCj4+PiAgZHJpdmVycy9oaWQvaGlkLXN0ZWFtLmMgICAgICAgICAgICAgICAgICAgIHwg
MiArLQ0KPj4+ICBkcml2ZXJzL2hpZC9pbnRlbC1pc2gtaGlkL2lzaHRwLWhpZC5jICAgICAgfCAy
ICstDQo+Pj4gIGRyaXZlcnMvaGlkL3N1cmZhY2UtaGlkL3N1cmZhY2VfaGlkX2NvcmUuYyB8IDIg
Ky0NCj4+PiAgZHJpdmVycy9wbGF0Zm9ybS94ODYvYXN1cy10ZjEwM2MtZG9jay5jICAgIHwgNCAr
Ky0tDQo+Pj4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hpZC5jICAgICAgICAgICAgICB8IDIg
Ky0NCj4+PiAgOCBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMo
LSkNCj4+PiAtLS0NCj4+PiBiYXNlLWNvbW1pdDogZTA0OTU1ZGI2YTdjM2ZjNGExZTY5Nzg2NDli
NjFhNmY1ZjgwMjhlMw0KPj4+IGNoYW5nZS1pZDogMjAyMzAxMzAtaGlkLWNvbnN0LWxsLWRyaXZl
ci1mY2ZkZDNhZjExYjgNCj4+Pg0KPj4+IEJlc3QgcmVnYXJkcywNCj4+DQo+IA0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWls
aW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBz
ZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
