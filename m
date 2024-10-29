Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC2C9B40AC
	for <lists+greybus-dev@lfdr.de>; Tue, 29 Oct 2024 03:58:39 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8EC8540A8F
	for <lists+greybus-dev@lfdr.de>; Tue, 29 Oct 2024 02:58:38 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	by lists.linaro.org (Postfix) with ESMTPS id 9597540A8F
	for <greybus-dev@lists.linaro.org>; Tue, 29 Oct 2024 02:58:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of yiyang13@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=yiyang13@huawei.com;
	dmarc=pass (policy=quarantine) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xcvzp13nGzyTwM;
	Tue, 29 Oct 2024 10:56:54 +0800 (CST)
Received: from kwepemk200016.china.huawei.com (unknown [7.202.194.82])
	by mail.maildlp.com (Postfix) with ESMTPS id C5CF6180064;
	Tue, 29 Oct 2024 10:58:31 +0800 (CST)
Received: from [10.67.108.122] (10.67.108.122) by
 kwepemk200016.china.huawei.com (7.202.194.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 29 Oct 2024 10:58:31 +0800
To: Alex Elder <elder@ieee.org>, Dan Carpenter <dan.carpenter@linaro.org>
References: <20241026081153.2649890-1-yiyang13@huawei.com>
 <9ada17f8-7b3a-4bf7-8fc8-f40bf67adb33@stanley.mountain>
 <a9cfb5e6-33f4-495c-b329-7e97f626d1a1@ieee.org>
From: "yiyang (D)" <yiyang13@huawei.com>
Message-ID: <541d16d3-ea2e-d956-5dd9-613ede430fe5@huawei.com>
Date: Tue, 29 Oct 2024 10:58:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <a9cfb5e6-33f4-495c-b329-7e97f626d1a1@ieee.org>
X-Originating-IP: [10.67.108.122]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk200016.china.huawei.com (7.202.194.82)
X-Spamd-Result: default: False [-6.40 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:45.249.212.187/29];
	RWL_MAILSPIKE_GOOD(-0.10)[45.249.212.187:from];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:134543, ipnet:45.249.212.0/24, country:CN];
	RBL_SENDERSCORE_REPUT_8(0.00)[45.249.212.187:from];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,projectara.com,lists.linaro.org,lists.linux.dev,huawei.com];
	R_DKIM_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 9597540A8F
X-Spamd-Bar: ------
Message-ID-Hash: PMLSKW3C5QIJZXRCO5KEVGWATGGRY3WM
X-Message-ID-Hash: PMLSKW3C5QIJZXRCO5KEVGWATGGRY3WM
X-MailFrom: yiyang13@huawei.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, ankov_svetlin@projectara.com, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, wangweiyang2@huawei.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix possible null-ptr-deref in gb_audio_manager_get_module()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PMLSKW3C5QIJZXRCO5KEVGWATGGRY3WM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiAyMDI0LzEwLzI4IDIwOjQ2LCBBbGV4IEVsZGVyIHdyb3RlOg0KPiBPbiAxMC8yNi8yNCA1
OjUwIEFNLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0KPj4gT24gU2F0LCBPY3QgMjYsIDIwMjQgYXQg
MDg6MTE6NTNBTSArMDAwMCwgWWkgWWFuZyB3cm90ZToNCj4+PiBUaGUgZ2JfYXVkaW9fbWFuYWdl
cl9nZXRfbW9kdWxlKCkgaXMgRVhQT1JUX1NZTUJPTCwgYW5kIHdpbGwgcmV0dXJuIE5VTEwNCj4+
PiB3aGVuIGluY29taW5nIHBhcmFtZXRlciBpZCA8IDAsIGZpeCBwb3NzaWJsZSBudWxsLXB0ci1k
ZXJlZiBieSBhZGQgY2hlY2sNCj4+PiBmb3IgcmV0dXJuIHZhbHVlLg0KPj4+DQo+Pj4gRml4ZXM6
IDhkYjAwNzM2ZDM2NSAoImdyZXlidXM6IGF1ZGlvOiBBZGQgQXVkaW8gTWFuYWdlciIpDQo+Pj4g
U2lnbmVkLW9mZi1ieTogWWkgWWFuZyA8eWl5YW5nMTNAaHVhd2VpLmNvbT4NCj4+DQo+PiBXaGVy
ZSBpcyBnYl9hdWRpb19tYW5hZ2VyX2dldF9tb2R1bGUoKSBjYWxsZWQgZnJvbT/CoCBTbyBmYXIg
YXMgSSBjYW4gDQo+PiBzZWUgaXQncw0KPj4gbmV2ZXIgdXNlZC7CoCBXaHkgbm90IGp1c3QgZGVs
ZXRlIGl0Pw0KPj4NCj4+IHJlZ2FyZHMsDQo+PiBkYW4gY2FycGVudGVyDQo+IA0KPiBJIGFncmVl
IHdpdGggdGhpcy7CoCBJIHN1c3BlY3RlZCBhbGwgY2FsbGVycyBtaWdodCBoYXZlIGd1YXJhbnRl
ZWQNCj4gdGhhdCB0aGUgImlkIiB2YWx1ZSBwYXNzZWQgd291bGQgYmUgYWx3YXlzIHZhbGlkLCBi
dXQuLi4gdGhlcmUgYXJlDQo+IG5vIGNhbGxlcnMuDQo+IA0KPiBJdCBpcyBhIHNpbXBsZSBmdW5j
dGlvbiwgYW5kIGNvdWxkIGJlIGFkZGVkIGJhY2sgYWdhaW4gaWYgaXQgaXMNCj4gbmVlZGVkIGlu
IHRoZSBmdXR1cmUgKHBvc3NpYmx5IGV2ZW4gYnkgcmV2ZXJ0aW5nIHRoZSBjb21taXQgdGhhdA0K
PiByZW1vdmVzIGl0KS4NCj4gDQo+IElmIHlvdSBkbyB0aGlzLCBwbGVhc2UgcmVtb3ZlIGdiX2F1
ZGlvX3B1dF9tb2R1bGUoKSBpbiB0aGUgc2FtZQ0KPiBwYXRjaC7CoCBJdCB0b28gaGFzIG5vIGNh
bGxlcnMuDQo+IA0KPiBUaGFuayB5b3UuDQo+IA0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLUFsZXgNCj4gDQo+IC4NCg0KSSB0cmllZCB0byBmaW5kIHRoZSBjYWxs
ZXIgYmVmb3JlIEkgbW9kaWZpZWQgaXQsIGJ1dCB1bmZvcnR1bmF0ZWx5IEkgDQpkaWRuJ3QgZmlu
ZCB0aGUgY2FsbGVyLCBzbyBJIHN1c3BlY3Qgc29tZSBub24ta2VybmVsIGRyaXZlciBjb2RlIHdp
bGwgDQp0cnkgdG8gY2FsbCB0aGlzIGZ1bmN0aW9ucy4NCg0KSSBqdXN0IGZvdW5kIHRoaXMgcHJv
YmxlbSB3aGlsZSByZWFkaW5nIHRoZSBjb2RlIGFuZCBJJ20gbm90IHN1cmUgaWYgSSANCnNob3Vs
ZCByZW1vdmUgdGhlIGZ1bmN0aW9uLg0KDQpyZWdhcmRzLA0KWWl5YW5nDQotLSANCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxp
bmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNl
bmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
