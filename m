Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB532D05DF
	for <lists+greybus-dev@lfdr.de>; Sun,  6 Dec 2020 17:16:45 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8AA6561892
	for <lists+greybus-dev@lfdr.de>; Sun,  6 Dec 2020 16:16:44 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 7C2AD619B1; Sun,  6 Dec 2020 16:16:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4C4EA66711;
	Sun,  6 Dec 2020 16:15:46 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E8A47604A8
 for <greybus-dev@lists.linaro.org>; Sat,  5 Dec 2020 10:44:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C0379608DD; Sat,  5 Dec 2020 10:44:09 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by lists.linaro.org (Postfix) with ESMTPS id 37028604A8
 for <greybus-dev@lists.linaro.org>; Sat,  5 Dec 2020 10:44:08 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cp5lW4gbWzhkcy;
 Sat,  5 Dec 2020 18:43:35 +0800 (CST)
Received: from [10.174.179.81] (10.174.179.81) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Sat, 5 Dec 2020 18:44:01 +0800
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Johan Hovold <johan@kernel.org>
References: <20201204021350.28182-1-wanghai38@huawei.com>
 <X8n2CL58pQ/077rQ@localhost>
 <CAAs3649kGerXZqgffwethn-JNOiiFSif1COM3no4Az4Ah220VA@mail.gmail.com>
From: "wanghai (M)" <wanghai38@huawei.com>
Message-ID: <5614008b-69b8-c37f-ddb9-7497862eb8bc@huawei.com>
Date: Sat, 5 Dec 2020 18:44:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAAs3649kGerXZqgffwethn-JNOiiFSif1COM3no4Az4Ah220VA@mail.gmail.com>
X-Originating-IP: [10.174.179.81]
X-CFilter-Loop: Reflected
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sun, 06 Dec 2020 16:15:43 +0000
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, aibhav.sr@gmail.com,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
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

CuWcqCAyMDIwLzEyLzUgMjowMiwgVmFpYmhhdiBBZ2Fyd2FsIOWGmemBkzoKPiBPbiBGcmksIERl
YyA0LCAyMDIwIGF0IDI6MTAgUE0gSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPiB3cm90
ZToKPj4gT24gRnJpLCBEZWMgMDQsIDIwMjAgYXQgMTA6MTM6NTBBTSArMDgwMCwgV2FuZyBIYWkg
d3JvdGU6Cj4+PiBBZGQgdGhlIG1pc3NpbmcgdW5sb2NrIGJlZm9yZSByZXR1cm4gZnJvbSBmdW5j
dGlvbgo+Pj4gZ2JhdWRpb19kYXBtX2ZyZWVfY29udHJvbHMoKSBpbiB0aGUgZXJyb3IgaGFuZGxp
bmcgY2FzZS4KPj4+Cj4+PiBGaXhlczogNTEwZTM0MGVmZTBjICgic3RhZ2luZzogZ3JleWJ1czog
YXVkaW86IEFkZCBoZWxwZXIgQVBJcyBmb3IgZHluYW1pYyBhdWRpbyBtb2R1bGUiKQo+Pj4gUmVw
b3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+Pj4gU2lnbmVkLW9mZi1i
eTogV2FuZyBIYWkgPHdhbmdoYWkzOEBodWF3ZWkuY29tPgo+Pj4gLS0tCj4+PiAgIGRyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jIHwgMSArCj4+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9hdWRpb19oZWxwZXIuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBl
ci5jCj4+PiBpbmRleCAyMzc1MzFiYTYwZjMuLjI5MzY3NWRiZWExMCAxMDA2NDQKPj4+IC0tLSBh
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jCj4+PiArKysgYi9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYwo+Pj4gQEAgLTEzNSw2ICsxMzUsNyBAQCBp
bnQgZ2JhdWRpb19kYXBtX2ZyZWVfY29udHJvbHMoc3RydWN0IHNuZF9zb2NfZGFwbV9jb250ZXh0
ICpkYXBtLAo+Pj4gICAgICAgICAgICAgICAgaWYgKCF3KSB7Cj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgIGRldl9lcnIoZGFwbS0+ZGV2LCAiJXM6IHdpZGdldCBub3QgZm91bmRcbiIsCj4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgd2lkZ2V0LT5uYW1lKTsKPj4+ICsgICAgICAg
ICAgICAgICAgICAgICBtdXRleF91bmxvY2soJmRhcG0tPmNhcmQtPmRhcG1fbXV0ZXgpOwo+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+ICAgICAgICAgICAgICAg
IH0KPj4+ICAgICAgICAgICAgICAgIHdpZGdldCsrOwo+PiBUaGlzIHN1cGVyZmljaWFsbHkgbG9v
a3MgY29ycmVjdCwgYnV0IHRoZXJlIHNlZW1zIHRvIGJlIGFub3RoZXIgYnVnIGluCj4+IHRoaXMg
ZnVuY3Rpb24uIEl0IGNhbiBiZSB1c2VkIGZyZWUgYW4gYXJyYXkgb2Ygd2lkZ2V0cywgYnV0IGlm
IG9uZSBvZgo+PiB0aGVtIGlzbid0IGZvdW5kIHdlIGp1c3QgbGVhayB0aGUgcmVzdC4gUGVyaGFw
cyB0aGF0IHJldHVybiBzaG91bGQKPj4gcmF0aGVyIGJlICJ3aWRnZXQrKzsgY29udGludWU7Ii4K
Pj4KPj4gVmFpYmhhdj8KPiBUaGFua3MgV2FuZyBmb3Igc2hhcmluZyB0aGUgcGF0Y2guIEFzIGFs
cmVhZHkgcG9pbnRlZCBieSBKb2hhbiwgdGhpcwo+IGZ1bmN0aW9uIGluZGVlZCBoYXMgYW5vdGhl
ciBidWcgYXMgd2VsbC4KPiBQbHMgZmVlbCBmcmVlIHRvIHNoYXJlIHRoZSBwYXRjaCBhcyBzdWdn
ZXN0ZWQgYWJvdmUuCkkganVzdCBzZW50IGFub3RoZXIgcGF0Y2gKCiJbUEFUQ0hdIHN0YWdpbmc6
IGdyZXlidXM6IGF1ZGlvOiBGaXggcG9zc2libGUgbGVhayBmcmVlIHdpZGdldHMgaW4gCmdiYXVk
aW9fZGFwbV9mcmVlX2NvbnRyb2xzIgoKPiBKb2hhbgo+IC4KPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3Jl
eWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1h
bi9saXN0aW5mby9ncmV5YnVzLWRldgo=
