Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 973866BDC02
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 23:51:03 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9A2453EF34
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 22:51:02 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	by lists.linaro.org (Postfix) with ESMTPS id 206BC3EA3F
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 14:51:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=VmrcOQrY;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.221.47 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id q16so7597364wrw.2
        for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 06:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678546313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NTyGiahvzsQx6sDWzDztFd/3tHnrkFadviqDemTjFAk=;
        b=VmrcOQrYSwQV3GHhymuNbikfTIPRLft+zy76bG4/a3MqV/JVBXU69qGUvIgLsWKGEf
         be5WfHPnRlIcwA15+6ctfzo+8hL2sLPtktBjekIXX+Ql0QtpFxFwsg6GwxLIEzHo6Jy3
         jSGEr/aWYJo4jC4OuX540W0v5Vj2BOh9oOBUVwhvRVVo1BH1FRlG8QNIA7087XE3B78b
         JOyjY45LBBov+aFy9nW6tM4fH+bjaCPzAOfw2ZIWcHuDrKoRwyqGmrGb1MKPDoYGGjhX
         hFvpNWkIPgm+BpooacQKs+hu4Eubkbpe0npHNYYBW7oJu0MKSOAVNSWoP6zQjfIe3CP3
         wQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678546313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NTyGiahvzsQx6sDWzDztFd/3tHnrkFadviqDemTjFAk=;
        b=O+6jsMJE81YVdneDVggZCLfaYBWwg5Uo3zngCwus/sEDARM/tOEJNx/GYl9RhdliWe
         Tx7q8LQSG3/7D7n3SUJQox8/DT8TuIZr/iwwsMID/2DoPfwCkNf7rZJiPuw2/Wu5EfRb
         w9avkrNM+72Tg2hCbb8isgn91fd0MCM9XjX6AHqE013e6URTHdSMJynrHxbO6W2dD5F4
         oNyL/WMJpNn7n7q1hFnFo9IRFuEE/n3m11bzOjjUmOdDkrO1fLoOtIm4MLuaPakv1ARy
         EMRKdtTd1PIinXvTcHSpuqbjQ1UIP7ihDu4fZ+DweEloTyh0IZoR5rEoeskBHPmUp0ik
         ToCw==
X-Gm-Message-State: AO0yUKXEDmlEIywg0n8DPD3AmzpHxEZed2HjzaFOb/SsxlPB0LwcHyyi
	4ZuXwnoqn5eOatruZOJx+l4=
X-Google-Smtp-Source: AK7set98xG33fG+YUFZ6RdmVhMIXKcq9Ng+RDMAMc2Pv4Ch44mmJ8SD+JritEW9jgWY6pN++H95bnw==
X-Received: by 2002:adf:ff92:0:b0:2c9:6562:232b with SMTP id j18-20020adfff92000000b002c96562232bmr18070401wrr.2.1678546312881;
        Sat, 11 Mar 2023 06:51:52 -0800 (PST)
Received: from [192.168.1.16] ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id r14-20020adff70e000000b002c5804b6afasm2527762wrp.67.2023.03.11.06.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 06:51:52 -0800 (PST)
Message-ID: <c9ae27dc-3538-5432-6a6d-3e2ff034f467@gmail.com>
Date: Sat, 11 Mar 2023 16:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Dan Carpenter <error27@gmail.com>
References: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>
 <10d2c15b-ff9f-4634-a013-7640c93435a7@kili.mountain>
Content-Language: en-US
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <10d2c15b-ff9f-4634-a013-7640c93435a7@kili.mountain>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 206BC3EA3F
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-6.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	RCVD_IN_DNSWL_HI(-1.00)[209.85.221.47:from,41.42.191.171:received];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.47:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: NBMSKM6DQBGWDHVKO5ADO2PY36XYEAA3
X-Message-ID-Hash: NBMSKM6DQBGWDHVKO5ADO2PY36XYEAA3
X-Mailman-Approved-At: Thu, 16 Mar 2023 22:50:29 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: eclose macro in a do - while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NBMSKM6DQBGWDHVKO5ADO2PY36XYEAA3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZodmh4oCPL9mj4oCPL9mi2aDZotmjINmh2aY62aDZpiwgRGFuIENhcnBlbnRlciB3cm90
ZToNCj4gT24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgMDM6NTk6MTlQTSArMDIwMCwgTWVubmEgTWFo
bW91ZCB3cm90ZToNCj4+ICIgRVJST1I6IE1hY3JvcyB3aXRoIG11bHRpcGxlIHN0YXRlbWVudHMg
c2hvdWxkIGJlIGVuY2xvc2VkIGluIGEgZG8gLQ0KPj4gd2hpbGUgbG9vcCINCj4+DQo+PiBSZXBv
cnRlZCBieSBjaGVja3BhdGguDQo+Pg0KPj4gZG8gbG9vcCB3aXRoIHRoZSBjb25kaXRpb25hbCBl
eHByZXNzaW9uIHNldCB0byBhIGNvbnN0YW50DQo+PiB2YWx1ZSBvZiB6ZXJvICgwKS5UaGlzIGNy
ZWF0ZXMgYSBsb29wIHRoYXQNCj4+IHdpbGwgZXhlY3V0ZSBleGFjdGx5IG9uZSB0aW1lLlRoaXMg
aXMgYSBjb2RpbmcgaWRpb20gdGhhdA0KPj4gYWxsb3dzIGEgbXVsdGktbGluZSBtYWNybyB0byBi
ZSB1c2VkIGFueXdoZXJlDQo+PiB0aGF0IGEgc2luZ2xlIHN0YXRlbWVudCBjYW4gYmUgdXNlZC4N
Cj4+DQo+PiBTbywgZW5jbG9zZSBgZ2JfbG9vcGJhY2tfc3RhdHNfYXR0cnNgIG1hY3JvIGluIGRv
IC0gd2hpbGUgKDApIHRvDQo+PiBmaXggY2hlY2twYXRoIGVycm9yDQo+Pg0KPj4gU2lnbmVkLW9m
Zi1ieTogTWVubmEgTWFobW91ZCA8ZW5nLm1lbm5hbWFobW91ZC5tbUBnbWFpbC5jb20+DQo+PiAt
LS0NCj4gVGhpcyBicmVha3MgdGhlIGJ1aWxkLiAgWW91IG5lZWQgdG8gY29tcGlsZSB0aGUgY29k
ZSBiZWZvcmUgc2VuZGluZyBhDQo+IHBhdGNoLg0KPg0KPiByZWdhcmRzLA0KPiBkYW4gY2FycGVu
dGVyDQoNCg0KSSBzZWUsIEkgdGhvdWdodCBidWlsZGluZyB0aGUgZmlsZSBvbmx5IGVub3VnaC4g
YXBwcmVjaWF0ZSB5b3VyIGZlZWRiYWNrLg0KDQoNClRoYW5rcywNCg0KTWVubmENCg0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBt
YWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmli
ZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
