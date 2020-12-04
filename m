Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AF82D05DC
	for <lists+greybus-dev@lfdr.de>; Sun,  6 Dec 2020 17:16:11 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 83031619B1
	for <lists+greybus-dev@lfdr.de>; Sun,  6 Dec 2020 16:16:10 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 7840765F75; Sun,  6 Dec 2020 16:16:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,BODY_URI_ONLY,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ECCA666702;
	Sun,  6 Dec 2020 16:15:44 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 64A2360D86
 for <greybus-dev@lists.linaro.org>; Fri,  4 Dec 2020 09:19:32 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 51E1F617DA; Fri,  4 Dec 2020 09:19:32 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by lists.linaro.org (Postfix) with ESMTPS id 9CE916162F
 for <greybus-dev@lists.linaro.org>; Fri,  4 Dec 2020 09:19:30 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CnRwN0GQKz15XR8;
 Fri,  4 Dec 2020 17:19:00 +0800 (CST)
Received: from [10.174.179.81] (10.174.179.81) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Dec 2020 17:19:25 +0800
To: Johan Hovold <johan@kernel.org>, Vaibhav Agarwal <vaibhav.sr@gmail.com>
References: <20201204021350.28182-1-wanghai38@huawei.com>
 <X8n2CL58pQ/077rQ@localhost>
From: "wanghai (M)" <wanghai38@huawei.com>
Message-ID: <d95dac95-09d0-66bb-4f3b-5ffa154be174@huawei.com>
Date: Fri, 4 Dec 2020 17:19:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <X8n2CL58pQ/077rQ@localhost>
X-Originating-IP: [10.174.179.81]
X-CFilter-Loop: Reflected
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sun, 06 Dec 2020 16:15:43 +0000
Cc: devel@driverdev.osuosl.org, elder@kernel.org, linux-kernel@vger.kernel.org,
 aibhav.sr@gmail.com, greybus-dev@lists.linaro.org, dan.carpenter@oracle.com
Subject: Re: [greybus-dev] [PATCH] staging: greybus: audio: Add missing
 unlock in gbaudio_dapm_free_controls()
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

CuWcqCAyMDIwLzEyLzQgMTY6NDAsIEpvaGFuIEhvdm9sZCDlhpnpgZM6Cj4gT24gRnJpLCBEZWMg
MDQsIDIwMjAgYXQgMTA6MTM6NTBBTSArMDgwMCwgV2FuZyBIYWkgd3JvdGU6Cj4+IEFkZCB0aGUg
bWlzc2luZyB1bmxvY2sgYmVmb3JlIHJldHVybiBmcm9tIGZ1bmN0aW9uCj4+IGdiYXVkaW9fZGFw
bV9mcmVlX2NvbnRyb2xzKCkgaW4gdGhlIGVycm9yIGhhbmRsaW5nIGNhc2UuCj4+Cj4+IEZpeGVz
OiA1MTBlMzQwZWZlMGMgKCJzdGFnaW5nOiBncmV5YnVzOiBhdWRpbzogQWRkIGhlbHBlciBBUElz
IGZvciBkeW5hbWljIGF1ZGlvIG1vZHVsZSIpCj4+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxo
dWxrY2lAaHVhd2VpLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogV2FuZyBIYWkgPHdhbmdoYWkzOEBo
dWF3ZWkuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxw
ZXIuYyB8IDEgKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9faGVscGVyLmMgYi9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYwo+PiBpbmRleCAyMzc1MzFiYTYwZjMuLjI5
MzY3NWRiZWExMCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9f
aGVscGVyLmMKPj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9faGVscGVyLmMK
Pj4gQEAgLTEzNSw2ICsxMzUsNyBAQCBpbnQgZ2JhdWRpb19kYXBtX2ZyZWVfY29udHJvbHMoc3Ry
dWN0IHNuZF9zb2NfZGFwbV9jb250ZXh0ICpkYXBtLAo+PiAgIAkJaWYgKCF3KSB7Cj4+ICAgCQkJ
ZGV2X2VycihkYXBtLT5kZXYsICIlczogd2lkZ2V0IG5vdCBmb3VuZFxuIiwKPj4gICAJCQkJd2lk
Z2V0LT5uYW1lKTsKPj4gKwkJCW11dGV4X3VubG9jaygmZGFwbS0+Y2FyZC0+ZGFwbV9tdXRleCk7
Cj4+ICAgCQkJcmV0dXJuIC1FSU5WQUw7Cj4+ICAgCQl9Cj4+ICAgCQl3aWRnZXQrKzsKPiBUaGlz
IHN1cGVyZmljaWFsbHkgbG9va3MgY29ycmVjdCwgYnV0IHRoZXJlIHNlZW1zIHRvIGJlIGFub3Ro
ZXIgYnVnIGluCj4gdGhpcyBmdW5jdGlvbi4gSXQgY2FuIGJlIHVzZWQgZnJlZSBhbiBhcnJheSBv
ZiB3aWRnZXRzLCBidXQgaWYgb25lIG9mCj4gdGhlbSBpc24ndCBmb3VuZCB3ZSBqdXN0IGxlYWsg
dGhlIHJlc3QuIFBlcmhhcHMgdGhhdCByZXR1cm4gc2hvdWxkCj4gcmF0aGVyIGJlICJ3aWRnZXQr
KzsgY29udGludWU7Ii4KPgpJIHRoaW5rIHRoaXMgaXMgYSBnb29kIGlkZWEsIHNob3VsZCBJIHNl
bmQgYSB2MiBwYXRjaD8KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJv
Lm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRl
dgo=
