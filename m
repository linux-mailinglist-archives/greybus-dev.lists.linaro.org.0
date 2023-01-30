Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 40009680784
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 09:36:51 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BEE334444C
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 08:36:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lists.linaro.org (Postfix) with ESMTPS id 2E7FF40EC6
	for <greybus-dev@lists.linaro.org>; Mon, 30 Jan 2023 08:36:44 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=L10uVsmP;
	spf=pass (lists.linaro.org: domain of hdegoede@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=hdegoede@redhat.com;
	dmarc=pass (policy=none) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675067804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4d/SMT2oPu4pWDgGmvW3ooby0A6gn9g87bNk00NILRw=;
	b=L10uVsmPHTLRKJh1JIQjvB7GuzYz4gpHqZ4LSW5HX44lPtIRxfnfQ7cGzJQUsO81PQ0BXM
	i/TgzNzR+OG5nktwhpyR7eFy0BPt17Z6+HmqAJdiNFwOwjzYp5nsRphOEjkyoDaJJaV0Ds
	SQQlh7RMBpQnzx5HfCDs4GyFCwQFFGQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-377-SxnRj-LOMtS3Yu3qQRrsgQ-1; Mon, 30 Jan 2023 03:36:35 -0500
X-MC-Unique: SxnRj-LOMtS3Yu3qQRrsgQ-1
Received: by mail-ed1-f70.google.com with SMTP id c12-20020a05640227cc00b0049e2c079aabso7609684ede.1
        for <greybus-dev@lists.linaro.org>; Mon, 30 Jan 2023 00:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4d/SMT2oPu4pWDgGmvW3ooby0A6gn9g87bNk00NILRw=;
        b=weZyHcA9ByXfpnD9LGtGd6aCW6kZ8xLeLOnt8EpNHXFTKDu9K1OVtzgKpXxaALA4JH
         m1eds6ReDrmL1R8AuQw4/nRwCwjwAEEtScw7lNdbMwRt7696WQPqGv25kwcetjsJgvJU
         3BdtJPRIqQ+y2Blltb3/NiXLbSyMUYtm/G2O4mXAaCMUeRr93TapSRPKSg10omS0KcB4
         dajmNeKxVVUzqN+OrxrW5itzpN0UgKTwI3I3wFWibgF15bWqee2DHrx1hhzqHl5p3hzF
         ubnKvmK5Zo9YfDO2HvHi4d33D0K7HNyL3Dhyj43qySJy+O5Zvf32Opu6DZc2no6vZ//4
         mdhQ==
X-Gm-Message-State: AO0yUKVQhy+roleN70O07IV/kFf96A4BCYbIvzyxph0JpIKXORBi8eve
	h6sn2LbNuBw74hJF/OnA8rMd4q5Gjd1UALI0+wzx5IseZL+UU9c8nz+K6aHWcApEQN8fAwYuzKF
	gL77jIJivI+WJQqIJMBiQPvMj
X-Received: by 2002:a17:906:475a:b0:887:981:5f7c with SMTP id j26-20020a170906475a00b0088709815f7cmr5019129ejs.11.1675067794097;
        Mon, 30 Jan 2023 00:36:34 -0800 (PST)
X-Google-Smtp-Source: AK7set/0R+gvMcJBFdYRnrzzxOkxWBZLXr5z/Tqk0BP+fIcTMCHK94EHX6VpDr3nSMq6rTGD5CNmOQ==
X-Received: by 2002:a17:906:475a:b0:887:981:5f7c with SMTP id j26-20020a170906475a00b0088709815f7cmr5019103ejs.11.1675067793927;
        Mon, 30 Jan 2023 00:36:33 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id z2-20020a170906714200b00888161349desm1582823ejj.182.2023.01.30.00.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 00:36:33 -0800 (PST)
Message-ID: <0937b9a5-0caa-2a73-33c4-82e6cab02ef0@redhat.com>
Date: Mon, 30 Jan 2023 09:36:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, =?UTF-8?Q?Filipe_La=c3=adns?=
 <lains@riseup.net>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, Mark Gross
 <markgross@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2E7FF40EC6
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-0.50)[209.85.208.70:received];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,none];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:170.10.129.0/24];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[170.10.129.124:from];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_IN_DNSWL_FAIL(0.00)[170.10.129.124:server fail];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[weissschuh.net,amd.com,kernel.org,redhat.com,microsoft.com,riseup.net,linux.intel.com,gmail.com,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:30031, ipnet:170.10.128.0/23, country:US];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action
Message-ID-Hash: JM3JFJV32ZBKRETMLTFTDATOFKK2SMM7
X-Message-ID-Hash: JM3JFJV32ZBKRETMLTFTDATOFKK2SMM7
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/9] HID: Constify lowlevel HID drivers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JM3JFJV32ZBKRETMLTFTDATOFKK2SMM7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCk9uIDEvMzAvMjMgMDQ6NTksIFRob21hcyBXZWnDn3NjaHVoIHdyb3RlOg0KPiBTaW5j
ZSA1MmQyMjUzNDY5MDQgKCJISUQ6IE1ha2UgbG93bGV2ZWwgZHJpdmVyIHN0cnVjdHMgY29uc3Qi
KSB0aGUNCj4gbG93bGV2ZWwgSElEIGRyaXZlcnMgYXJlIG9ubHkgZXhwb3NlZCBhcyBjb25zdC4N
Cj4gDQo+IFRha2UgYWR2YW50YWdlIG9mIHRoaXMgdG8gY29uc3RpZnkgdGhlIHVuZGVybHlpbmcg
c3RydWN0dXJlcywgdG9vLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWgg
PGxpbnV4QHdlaXNzc2NodWgubmV0Pg0KDQpUaGFua3MsIHNlcmllcyBsb29rcyBnb29kIHRvIG1l
Og0KDQpSZXZpZXdlZC1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCg0K
SSdsbCBhbHNvIHBpY2sgdXAgLyBtZXJnZSBwYXRjaGVzIDcgKyA4IGludG8gcGR4ODYvZm9yLW5l
eHQNCnNvbWV0aW1lIHRoaXMgd2Vlay4NCg0KUmVnYXJkcywNCg0KSGFucw0KDQoNCg0KPiAtLS0N
Cj4gVGhvbWFzIFdlacOfc2NodWggKDkpOg0KPiAgICAgICBISUQ6IGFtZF9zZmg6IENvbnN0aWZ5
IGxvd2xldmVsIEhJRCBkcml2ZXINCj4gICAgICAgSElEOiBoeXBlcnY6IENvbnN0aWZ5IGxvd2xl
dmVsIEhJRCBkcml2ZXINCj4gICAgICAgSElEOiBsb2dpdGVjaC1kajogQ29uc3RpZnkgbG93bGV2
ZWwgSElEIGRyaXZlcg0KPiAgICAgICBISUQ6IHN0ZWFtOiBDb25zdGlmeSBsb3dsZXZlbCBISUQg
ZHJpdmVyDQo+ICAgICAgIEhJRDogaW50ZWwtaXNoLWhpZDogQ29uc3RpZnkgbG93bGV2ZWwgSElE
IGRyaXZlcg0KPiAgICAgICBISUQ6IHN1cmZhY2UtaGlkOiBDb25zdGlmeSBsb3dsZXZlbCBISUQg
ZHJpdmVyDQo+ICAgICAgIHBsYXRmb3JtL3g4NjogYXN1cy10ZjEwM2MtZG9jazogQ29uc3RpZnkg
bG93bGV2ZWwgSElEIGRyaXZlcg0KPiAgICAgICBwbGF0Zm9ybS94ODY6IGFzdXMtdGYxMDNjLWRv
Y2s6IENvbnN0aWZ5IHRvcHJvdyBrZXltYXANCj4gICAgICAgc3RhZ2luZzogZ3JleWJ1czogaGlk
OiBDb25zdGlmeSBsb3dsZXZlbCBISUQgZHJpdmVyDQo+IA0KPiAgZHJpdmVycy9oaWQvYW1kLXNm
aC1oaWQvYW1kX3NmaF9oaWQuYyAgICAgIHwgMiArLQ0KPiAgZHJpdmVycy9oaWQvaGlkLWh5cGVy
di5jICAgICAgICAgICAgICAgICAgIHwgMiArLQ0KPiAgZHJpdmVycy9oaWQvaGlkLWxvZ2l0ZWNo
LWRqLmMgICAgICAgICAgICAgIHwgNCArKy0tDQo+ICBkcml2ZXJzL2hpZC9oaWQtc3RlYW0uYyAg
ICAgICAgICAgICAgICAgICAgfCAyICstDQo+ICBkcml2ZXJzL2hpZC9pbnRlbC1pc2gtaGlkL2lz
aHRwLWhpZC5jICAgICAgfCAyICstDQo+ICBkcml2ZXJzL2hpZC9zdXJmYWNlLWhpZC9zdXJmYWNl
X2hpZF9jb3JlLmMgfCAyICstDQo+ICBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9hc3VzLXRmMTAzYy1k
b2NrLmMgICAgfCA0ICsrLS0NCj4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hpZC5jICAgICAg
ICAgICAgICB8IDIgKy0NCj4gIDggZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogZTA0OTU1ZGI2YTdjM2ZjNGExZTY5
Nzg2NDliNjFhNmY1ZjgwMjhlMw0KPiBjaGFuZ2UtaWQ6IDIwMjMwMTMwLWhpZC1jb25zdC1sbC1k
cml2ZXItZmNmZGQzYWYxMWI4DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlz
dCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4g
ZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
