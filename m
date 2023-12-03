Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 516B8802171
	for <lists+greybus-dev@lfdr.de>; Sun,  3 Dec 2023 08:17:30 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 01E363F65B
	for <lists+greybus-dev@lfdr.de>; Sun,  3 Dec 2023 07:17:29 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	by lists.linaro.org (Postfix) with ESMTPS id 06F253F65B
	for <greybus-dev@lists.linaro.org>; Sun,  3 Dec 2023 07:17:23 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Gwxt4NX4;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.171 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6cb55001124so3492891b3a.0
        for <greybus-dev@lists.linaro.org>; Sat, 02 Dec 2023 23:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701587842; x=1702192642; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CfTKmTcoIZjeKZQASJtJ+cTwOxU9NGJjwL6rBXc5GsQ=;
        b=Gwxt4NX4WSjP7sg27W6pTprju7eTccPNUA8IBJLRUdilLJ+Yq85aYty5OG9hbO9PFt
         Wcm3ihHgz+5E23xaFlWWFO+z0SRGKhnJu9baLgUKBuFToEVbWEiHN+5K6boQHWfoITPX
         yx7elA22VRYUlOwt1sCmxXzrswVGi6toVGUoAYx7EXudoiJ/3GY0ACRXrv2cj3lybULW
         vvpsS/tM481mpCUOz6AjuhB25ToFTCnbn1ZBwRqWlEY/xlZTP3uZP6UmeTQIXR8zdZjt
         6OXRur4fCYSvA1AHzjdfjnfcSUzz3C0pQCgiY8m2huRJHG39qK2l1G35ykLRBQlr9Hvg
         WZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701587842; x=1702192642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CfTKmTcoIZjeKZQASJtJ+cTwOxU9NGJjwL6rBXc5GsQ=;
        b=mC1STwizH3O+uejT+q+ihRbdBYIgEouBRuaIToqPwMHFvlk2QAPOeEBYep2a1zul2Y
         G27IgLXVu7pkRLS81WCamZXvmY7E/ddoR7xqREjguC0kU3jM4Iubjy+y3nReZUKYJ9Zf
         qkWbC0aTg82GdikwFKjsS7vWpJ42VlhUv+J7OtD6zuNp5kJtm4NBE6D05DVPZ1+zb4B8
         4/k8+j1W1bd+gB8q7GVh9E8vzEgD1D5vwJG0yq5/QpN7kwodNi83v9eGQDAxgJt65Vdh
         mEEkf+PtFhCAwfBwqIjd8d+qyKV8iMoc/FaO/bmjOUzz3Z+LQZfbLJ7GFzG+ynnnkO2N
         iS/Q==
X-Gm-Message-State: AOJu0Yxo11YI+3H9J9rc6UdUl0ndC6HVaMKdZLk7aHInE29cwl9+ZaUp
	UZzBJccGHcnPPML5DwKZszg=
X-Google-Smtp-Source: AGHT+IGGUI4OufP5G1eDvjfBKvHdT4e4o5GBFj7MhGryxLC59egOc/jgBZQaoKdM9qCBOyOj4GvcRg==
X-Received: by 2002:a05:6a20:b79f:b0:18f:97c:3865 with SMTP id fh31-20020a056a20b79f00b0018f097c3865mr1564954pzb.63.1701587841948;
        Sat, 02 Dec 2023 23:17:21 -0800 (PST)
Received: from ?IPV6:2401:4900:1f3e:53bf:50c7:2988:e019:4b97? ([2401:4900:1f3e:53bf:50c7:2988:e019:4b97])
        by smtp.gmail.com with ESMTPSA id i185-20020a62c1c2000000b006c988fda657sm6003574pfg.177.2023.12.02.23.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Dec 2023 23:17:21 -0800 (PST)
Message-ID: <32cf0a82-23b0-437e-b466-c05ceeb87da6@gmail.com>
Date: Sun, 3 Dec 2023 12:47:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alex Elder <elder@ieee.org>, greybus-dev@lists.linaro.org
References: <20231114140103.784484-1-ayushdevel1325@gmail.com>
 <fea9d86b-54c7-493b-a7bd-8320bc2e8ced@ieee.org>
Content-Language: en-US
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <fea9d86b-54c7-493b-a7bd-8320bc2e8ced@ieee.org>
X-Rspamd-Queue-Id: 06F253F65B
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.99 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.210.171:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: ZDXMAUJOR3LJ7KA7SBFNINCSE6IKCIQ2
X-Message-ID-Hash: ZDXMAUJOR3LJ7KA7SBFNINCSE6IKCIQ2
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, kernel test robot <yujie.liu@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: gb-beagleplay: fix restricted __le16 degrades to integer warning
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZDXMAUJOR3LJ7KA7SBFNINCSE6IKCIQ2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

SSBhcG9sb2dpemUgZm9yIHRoZSBsYXRlIHJlc3BvbnNlIChjb2xsZWdlIGV4YW1zIHdlcmUgZ29p
bmcgb24pLg0KDQpJIHdpbGwgZ28gdGhyb3VnaCB0aGUgZHJpdmVyIHRvIGZpbmQgaWYgYW55IG90
aGVyIGVuZGlhbm5lc3MgZml4ZXMgYXJlIA0KbmVlZGVkLg0KDQpBcyBmb3IgYGhkbGNfcGF5bG9h
ZC0+bGVuYCwgdGhlIHdob2xlIGBoZGxjX3BheWxvYWRgIGlzIGFuIGFic3RyYWN0aW9uIA0KdG8g
c3RvcmUgYXJyYXkgbGVuZ3RoIHdpdGggdGhlIGFjdHVhbCBwb2ludGVyLiBUaGUgbGVuIGlzIG5l
dmVyIGFjdHVhbGx5IA0Kc2VudCBvdmVyIEhETEMsIHNvIGl0IHNob3VsZCBiZSBmaW5lLg0KDQoN
CkF5dXNoIFNpbmdoDQoNCk9uIDExLzE0LzIzIDIwOjI3LCBBbGV4IEVsZGVyIHdyb3RlOg0KPiBP
biAxMS8xNC8yMyA4OjAxIEFNLCBBeXVzaCBTaW5naCB3cm90ZToNCj4+IGdyZXlidXMgbWVzc2Fn
ZSBoZWFkZXItPnNpemUgYXJlIG9mIHR5cGUgX19sZTE2LCBzbyB0byBmaXggdGhpcyB3YXJuaW5n
cw0KPj4gd2UgYXJlIHVzaW5nIGxlMTZfdG9fY3B1KCkgbWFjcm9zLg0KPg0KPiBUaGlzIGlzIG1v
cmUgdGhhbiBhIHdhcm5pbmcsIGl0J3MgYSBidWcgKHRob3VnaCBpdCBoYXMgbm8NCj4gZWZmZWN0
IHdpdGggYSBsaXR0bGUtZW5kaWFuIG5hdGl2ZSBDUFUpLg0KPg0KPiBJIHN1Z2dlc3QgeW91IGFk
ZDoNCj4NCj4gRml4ZXM6IGVjNTU4YmJmZWE2NzEgKCJncmV5YnVzOiBBZGQgQmVhZ2xlUGxheSBM
aW51eCBEcml2ZXIiKQ0KPg0KPiBTaG91bGQgeW91ciBoZGxjX3BheWxvYWQtPmxlbiBmaWVsZCBi
ZSBkZWZpbmVkIGFzIGxpdHRsZS1lbmRpYW4/DQo+IEkndmUgb25seSBzY2FubmVkIHRocm91Z2gg
dGhpcyBmaWxlIGF0IHRoaXMgcG9pbnQgYnV0IEknbSB0aGlua2luZw0KPiB0aGVyZSBtaWdodCBi
ZSBvdGhlciBlbmRpYW5uZXNzIGZpeGVzIG5lZWRlZCBhcyB3ZWxsLg0KPg0KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtQWxleA0KPg0KPg0KPg0KPj4NCj4+IFJlcG9y
dGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8eXVqaWUubGl1QGludGVsLmNvbT4NCj4+IENsb3Nl
czogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIzMTEwNzIzMjkuWG9najdoR1ctbGtwQGlu
dGVsLmNvbS8NCj4+IFNpZ25lZC1vZmYtYnk6IEF5dXNoIFNpbmdoIDxheXVzaGRldmVsMTMyNUBn
bWFpbC5jb20+DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvZ3JleWJ1cy9nYi1iZWFnbGVwbGF5LmMg
fCAyICstDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2diLWJlYWdsZXBsYXkuYyAN
Cj4+IGIvZHJpdmVycy9ncmV5YnVzL2diLWJlYWdsZXBsYXkuYw0KPj4gaW5kZXggNDMzMThjMTk5
M2JhLi5iM2Y0N2I1Y2JiZmEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dyZXlidXMvZ2ItYmVh
Z2xlcGxheS5jDQo+PiArKysgYi9kcml2ZXJzL2dyZXlidXMvZ2ItYmVhZ2xlcGxheS5jDQo+PiBA
QCAtMzQ0LDcgKzM0NCw3IEBAIHN0YXRpYyBpbnQgZ2JfbWVzc2FnZV9zZW5kKHN0cnVjdCBnYl9o
b3N0X2RldmljZSANCj4+ICpoZCwgdTE2IGNwb3J0LCBzdHJ1Y3QgZ2JfbWVzc2ENCj4+IMKgwqDC
oMKgwqAgZGV2X2RiZygmaGQtPmRldiwgIlNlbmRpbmcgZ3JleWJ1cyBtZXNzYWdlIHdpdGggT3Bl
cmF0aW9uICV1LCANCj4+IFR5cGU6ICVYIG9uIENwb3J0ICV1IiwNCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBtc2ctPmhlYWRlci0+b3BlcmF0aW9uX2lkLCBtc2ctPmhlYWRlci0+dHlwZSwgY3BvcnQp
Ow0KPj4gwqAgLcKgwqDCoCBpZiAobXNnLT5oZWFkZXItPnNpemUgPiBSWF9IRExDX1BBWUxPQUQp
DQo+PiArwqDCoMKgIGlmIChsZTE2X3RvX2NwdShtc2ctPmhlYWRlci0+c2l6ZSkgPiBSWF9IRExD
X1BBWUxPQUQpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRldl9lcnJfcHJvYmUoJmhk
LT5kZXYsIC1FMkJJRywgIkdyZXlidXMgbWVzc2FnZSB0b28gDQo+PiBiaWciKTsNCj4+IMKgIMKg
wqDCoMKgwqAgbWVtY3B5KG1zZy0+aGVhZGVyLT5wYWQsICZjcG9ydCwgc2l6ZW9mKGNwb3J0KSk7
DQo+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5
YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1
bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFy
by5vcmcK
