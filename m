Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 632486813B5
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 15:46:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 720663F33B
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 14:46:31 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	by lists.linaro.org (Postfix) with ESMTPS id 5F90A40EC4
	for <greybus-dev@lists.linaro.org>; Mon, 30 Jan 2023 11:53:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=DV8o93oC;
	spf=pass (lists.linaro.org: domain of luzmaximilian@gmail.com designates 209.85.221.50 as permitted sender) smtp.mailfrom=luzmaximilian@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id o18so1324989wrj.3
        for <greybus-dev@lists.linaro.org>; Mon, 30 Jan 2023 03:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hGloNujiL0CsgogRLovAVVyc6KEZFVadDdcOWuMAQsQ=;
        b=DV8o93oCQ73nQnF6DKwI5AzadrxQNopoi9mYTUm8VXhAF/qN4J/4O5a5pBBbHw9+dy
         ZtqDU02mUJOTkEW3lXS3R4n610Pein98fCIAQDcPn38n+/aaJTet9MP1WMw6Ww+6CLjl
         5+F6klm8htSBwuIFCZuPNW8wrPHaMMr5XyxIO55Z5H/9Xdgn0JQLD7q/ME/fr/X2RCIK
         mPYzzMe8sPJBT6nzlF/rTs46FncTH6ZMAuUjEgDxMl/Zh2q7TeWkqSU5R2ip/hnPFhMB
         8SAFIo3GB6loDpJxArn2vu8S4eiM5GYSaLAh0+spfd730xZq+zplUPNsNfLeEnYM21aw
         t2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hGloNujiL0CsgogRLovAVVyc6KEZFVadDdcOWuMAQsQ=;
        b=JXW2I/TA1Sz1Xy7I77LEVCehPULf1/Vbf1NisdwbCxcGeiUKnomcVDlQtRD+VO4E0z
         Wvz81uRM8hU1QGkGVIrk3paj/HtdfI+szuiYA8xyuAJDs9P+YSKJw/7RoN2sTojOiE5e
         4ITtSb9IIW86umPEGH99YN5owUbh5LFTdVeHZGBmUurxuq95/kFwIiDrc/zj31brnQdZ
         o5yxlI+o2FOWJovRmPJ6M+z/IabNCrh/vbBZHn5rF7S1fDGUmLQVe/9ggjVgUPj3m4Mq
         WIdlRjJyZBGp0eBWFZ8X1So2damwxDPKi9dqZpcSCNXjRXtRb1STDmxB82FfdJOighUf
         nEQA==
X-Gm-Message-State: AO0yUKVi1KrL+/6sh59o32FUpRtpkuahbXYfWFA2FhEyjYBVBmEK59wS
	I+sOzN8n/TetxpcR2ohWzx0=
X-Google-Smtp-Source: AK7set99aypYxsMEBlz2WZVjweCmV/hwIdnZNU+KENU9bagNUuU2UXoj/aDRU6yeJuS1ze7BTzlhow==
X-Received: by 2002:adf:f8cb:0:b0:2bf:b047:d4af with SMTP id f11-20020adff8cb000000b002bfb047d4afmr19424812wrq.5.1675079630213;
        Mon, 30 Jan 2023 03:53:50 -0800 (PST)
Received: from [192.168.2.202] (pd9ea3cac.dip0.t-ipconnect.de. [217.234.60.172])
        by smtp.gmail.com with ESMTPSA id t27-20020adfa2db000000b002366553eca7sm11594342wra.83.2023.01.30.03.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 03:53:49 -0800 (PST)
Message-ID: <4a196e8f-cbc9-7453-6e36-aad458549e25@gmail.com>
Date: Mon, 30 Jan 2023 12:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, =?UTF-8?Q?Filipe_La=c3=adns?=
 <lains@riseup.net>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
 <20230130-hid-const-ll-driver-v1-6-3fc282b3b1d0@weissschuh.net>
Content-Language: en-US
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20230130-hid-const-ll-driver-v1-6-3fc282b3b1d0@weissschuh.net>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5F90A40EC4
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.50:from];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[weissschuh.net,amd.com,kernel.org,redhat.com,microsoft.com,riseup.net,linux.intel.com,gmail.com,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: luzmaximilian@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZCVMFQ54JVY6RVSH6AHXJW2JV5FTMWYS
X-Message-ID-Hash: ZCVMFQ54JVY6RVSH6AHXJW2JV5FTMWYS
X-Mailman-Approved-At: Mon, 30 Jan 2023 14:45:34 +0000
CC: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 6/9] HID: surface-hid: Constify lowlevel HID driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZCVMFQ54JVY6RVSH6AHXJW2JV5FTMWYS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMS8zMC8yMyAwNDo1OSwgVGhvbWFzIFdlacOfc2NodWggd3JvdGU6DQo+IFNpbmNlIGNvbW1p
dCA1MmQyMjUzNDY5MDQgKCJISUQ6IE1ha2UgbG93bGV2ZWwgZHJpdmVyIHN0cnVjdHMgY29uc3Qi
KQ0KPiB0aGUgbG93bGV2ZWwgSElEIGRyaXZlcnMgYXJlIG9ubHkgZXhwb3NlZCBhcyBjb25zdC4N
Cj4gDQo+IFRha2UgYWR2YW50YWdlIG9mIHRoaXMgdG8gY29uc3RpZnkgdGhlIHVuZGVybHlpbmcg
c3RydWN0dXJlLCB0b28uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8
bGludXhAd2Vpc3NzY2h1aC5uZXQ+DQoNCkxvb2tzIGdvb2QgdG8gbWUuDQoNClJldmlld2VkLWJ5
OiBNYXhpbWlsaWFuIEx1eiA8bHV6bWF4aW1pbGlhbkBnbWFpbC5jb20+DQoNCj4gLS0tDQo+ICAg
ZHJpdmVycy9oaWQvc3VyZmFjZS1oaWQvc3VyZmFjZV9oaWRfY29yZS5jIHwgMiArLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaGlkL3N1cmZhY2UtaGlkL3N1cmZhY2VfaGlkX2NvcmUuYyBiL2RyaXZl
cnMvaGlkL3N1cmZhY2UtaGlkL3N1cmZhY2VfaGlkX2NvcmUuYw0KPiBpbmRleCA4NzYzN2Y4MTNk
ZTIuLmEzZTljY2VkZGZhYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9oaWQvc3VyZmFjZS1oaWQv
c3VyZmFjZV9oaWRfY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvaGlkL3N1cmZhY2UtaGlkL3N1cmZh
Y2VfaGlkX2NvcmUuYw0KPiBAQCAtMTc0LDcgKzE3NCw3IEBAIHN0YXRpYyBpbnQgc3VyZmFjZV9o
aWRfcmF3X3JlcXVlc3Qoc3RydWN0IGhpZF9kZXZpY2UgKmhpZCwgdW5zaWduZWQgY2hhciByZXBv
cnRuDQo+ICAgCXJldHVybiAtRUlPOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBzdHJ1Y3QgaGlk
X2xsX2RyaXZlciBzdXJmYWNlX2hpZF9sbF9kcml2ZXIgPSB7DQo+ICtzdGF0aWMgY29uc3Qgc3Ry
dWN0IGhpZF9sbF9kcml2ZXIgc3VyZmFjZV9oaWRfbGxfZHJpdmVyID0gew0KPiAgIAkuc3RhcnQg
ICAgICAgPSBzdXJmYWNlX2hpZF9zdGFydCwNCj4gICAJLnN0b3AgICAgICAgID0gc3VyZmFjZV9o
aWRfc3RvcCwNCj4gICAJLm9wZW4gICAgICAgID0gc3VyZmFjZV9oaWRfb3BlbiwNCj4gDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBt
YWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmli
ZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
