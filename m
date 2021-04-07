Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 763763567F1
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 11:25:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 969F1665FB
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 09:25:53 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 897EB66631; Wed,  7 Apr 2021 09:25:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1FE1D6679D;
	Wed,  7 Apr 2021 09:23:42 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C3B3560861
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 08:43:46 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A801C60919; Wed,  7 Apr 2021 08:43:46 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by lists.linaro.org (Postfix) with ESMTPS id 15D5460861
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 08:43:45 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FFdCv5DBXzyNfm;
 Wed,  7 Apr 2021 16:41:31 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.144) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Wed, 7 Apr 2021
 16:43:32 +0800
To: Greg KH <gregkh@linuxfoundation.org>
References: <1617778203-23117-1-git-send-email-tiantao6@hisilicon.com>
 <YG1rwdRzKk83RBmG@kroah.com>
 <5126cb93-4227-8a0f-1421-7685ade4b2e2@huawei.com>
 <YG1wFcQvKmYsziLt@kroah.com>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <e0dbaeef-c1e3-388f-3bc7-ad80a5cdb97f@huawei.com>
Date: Wed, 7 Apr 2021 16:43:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YG1wFcQvKmYsziLt@kroah.com>
X-Originating-IP: [10.40.188.144]
X-CFilter-Loop: Reflected
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 07 Apr 2021 09:23:30 +0000
Cc: elder@kernel.org, linux-staging@lists.linux.dev, hvaibhav.linux@gmail.com,
 johan@kernel.org, greybus-dev@lists.linaro.org,
 Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: move to use request_irq
 by IRQF_NO_AUTOEN flag
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

CuWcqCAyMDIxLzQvNyAxNjo0MCwgR3JlZyBLSCDlhpnpgZM6Cj4gT24gV2VkLCBBcHIgMDcsIDIw
MjEgYXQgMDQ6Mjk6NTlQTSArMDgwMCwgdGlhbnRhbyAoSCkgd3JvdGU6Cj4+IOWcqCAyMDIxLzQv
NyAxNjoyMiwgR3JlZyBLSCDlhpnpgZM6Cj4+PiBPbiBXZWQsIEFwciAwNywgMjAyMSBhdCAwMjo1
MDowM1BNICswODAwLCBUaWFuIFRhbyB3cm90ZToKPj4+PiBkaXNhYmxlX2lycSgpIGFmdGVyIHJl
cXVlc3RfaXJxKCkgc3RpbGwgaGFzIGEgdGltZSBnYXAgaW4gd2hpY2gKPj4+PiBpbnRlcnJ1cHRz
IGNhbiBjb21lLiByZXF1ZXN0X2lycSgpIHdpdGggSVJRRl9OT19BVVRPRU4gZmxhZyB3aWxsCj4+
Pj4gZGlzYWJsZSBJUlEgYXV0by1lbmFibGUgYmVjYXVzZSBvZiByZXF1ZXN0aW5nLgo+Pj4+Cj4+
Pj4gdGhpcyBwYXRjaCBpcyBtYWRlIGJhc2Ugb24gImFkZCBJUlFGX05PX0FVVE9FTiBmb3IgcmVx
dWVzdF9pcnEiIHdoaWNoCj4+Pj4gaXMgYmVpbmcgbWVyZ2VkOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTM4ODc2NS8KPj4+IENhbiB5b3Ugd2FpdCB1bnRpbCB0aGF0
IGlzIG1lcmdlZCBiZWZvcmUgc2VuZGluZyB0aGlzIG91dCB0byB1cyBhcyB3ZQo+Pj4gY2FuJ3Qg
ZG8gYW55dGhpbmcgdW50aWwgdGhlbi4KPj4gdGhpcyBpcyBhbHJlYWR5IGluIGxpbnV4LW5leHQu
Z2l0Lgo+Pgo+PiBjYmUxNmYzIGdlbmlycTogQWRkIElSUUZfTk9fQVVUT0VOIGZvciByZXF1ZXN0
X2lycS9ubWkoKQo+IFRoYXQncyBncmVhdCwgYnV0IG5vdGUgdGhhdCBsaW51eC1uZXh0IGlzIGEg
Y29tYmluZWQgdHJlZSBvZiBhbGwKPiBzdWJzeXN0ZW0gdHJlZXMuICBJdCdzIGltcG9zc2libGUg
Zm9yIGEgc3Vic3lzdGVtIHRyZWUgdG8gaW5jbHVkZQo+IGxpbnV4LW5leHQgOikKPgo+IFNvIGhv
dyBhYm91dCB3ZSB3YWl0IHVudGlsIHRoaXMgZ2V0cyBpbnRvIExpbnVzJ3MgdHJlZSBzbyB0aGF0
IHdlIGRvIG5vdAo+IGFsbCBzdWRkZW5seSBnZXQgcHJvYmxlbXMgaW4gb3VyIGluZGl2aWR1YWwg
c3Vic3lzdGVtIHRyZWVzLgo+Cj4gdGhhbmtzLApva++8jEkgd2lsbCByZXNlbmQgbGF0ZXIuCj4K
PiBncmVnIGstaAo+IC4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFy
by5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1k
ZXYK
