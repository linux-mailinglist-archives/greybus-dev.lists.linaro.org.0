Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C693567EF
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 11:25:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D03BC6187F
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 09:25:41 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id BCD38665EE; Wed,  7 Apr 2021 09:25:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E586F66799;
	Wed,  7 Apr 2021 09:23:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 9F80960765
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 08:30:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8B7F460919; Wed,  7 Apr 2021 08:30:13 +0000 (UTC)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by lists.linaro.org (Postfix) with ESMTPS id 9DB3C60765
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 08:30:11 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FFcwF5tXBz7tKn;
 Wed,  7 Apr 2021 16:27:57 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.144) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Wed, 7 Apr 2021
 16:30:00 +0800
To: Greg KH <gregkh@linuxfoundation.org>, Tian Tao <tiantao6@hisilicon.com>
References: <1617778203-23117-1-git-send-email-tiantao6@hisilicon.com>
 <YG1rwdRzKk83RBmG@kroah.com>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <5126cb93-4227-8a0f-1421-7685ade4b2e2@huawei.com>
Date: Wed, 7 Apr 2021 16:29:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YG1rwdRzKk83RBmG@kroah.com>
X-Originating-IP: [10.40.188.144]
X-CFilter-Loop: Reflected
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 07 Apr 2021 09:23:30 +0000
Cc: linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org,
 elder@kernel.org, hvaibhav.linux@gmail.com, johan@kernel.org
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

CuWcqCAyMDIxLzQvNyAxNjoyMiwgR3JlZyBLSCDlhpnpgZM6Cj4gT24gV2VkLCBBcHIgMDcsIDIw
MjEgYXQgMDI6NTA6MDNQTSArMDgwMCwgVGlhbiBUYW8gd3JvdGU6Cj4+IGRpc2FibGVfaXJxKCkg
YWZ0ZXIgcmVxdWVzdF9pcnEoKSBzdGlsbCBoYXMgYSB0aW1lIGdhcCBpbiB3aGljaAo+PiBpbnRl
cnJ1cHRzIGNhbiBjb21lLiByZXF1ZXN0X2lycSgpIHdpdGggSVJRRl9OT19BVVRPRU4gZmxhZyB3
aWxsCj4+IGRpc2FibGUgSVJRIGF1dG8tZW5hYmxlIGJlY2F1c2Ugb2YgcmVxdWVzdGluZy4KPj4K
Pj4gdGhpcyBwYXRjaCBpcyBtYWRlIGJhc2Ugb24gImFkZCBJUlFGX05PX0FVVE9FTiBmb3IgcmVx
dWVzdF9pcnEiIHdoaWNoCj4+IGlzIGJlaW5nIG1lcmdlZDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvcGF0Y2h3b3JrL3BhdGNoLzEzODg3NjUvCj4gQ2FuIHlvdSB3YWl0IHVudGlsIHRoYXQgaXMg
bWVyZ2VkIGJlZm9yZSBzZW5kaW5nIHRoaXMgb3V0IHRvIHVzIGFzIHdlCj4gY2FuJ3QgZG8gYW55
dGhpbmcgdW50aWwgdGhlbi4KCnRoaXMgaXMgYWxyZWFkeSBpbiBsaW51eC1uZXh0LmdpdC4KCmNi
ZTE2ZjMgZ2VuaXJxOiBBZGQgSVJRRl9OT19BVVRPRU4gZm9yIHJlcXVlc3RfaXJxL25taSgpCgoK
Pgo+IHRoYW5rcywKPgo+IGdyZWcgay1oCj4gLgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0
aW5mby9ncmV5YnVzLWRldgo=
