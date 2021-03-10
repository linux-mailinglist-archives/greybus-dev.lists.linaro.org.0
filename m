Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EFC333648
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Mar 2021 08:21:36 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7B6EA60EFD
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Mar 2021 07:21:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6A28E6678D; Wed, 10 Mar 2021 07:21:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B3EAA6651C;
	Wed, 10 Mar 2021 07:21:21 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D91CA60EFD
 for <greybus-dev@lists.linaro.org>; Wed, 10 Mar 2021 07:21:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id BE0FE617DA; Wed, 10 Mar 2021 07:21:19 +0000 (UTC)
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 by lists.linaro.org (Postfix) with ESMTPS id A476660EFD
 for <greybus-dev@lists.linaro.org>; Wed, 10 Mar 2021 07:21:18 +0000 (UTC)
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1lJt9f-0001ZM-Fz; Wed, 10 Mar 2021 08:21:15 +0100
Received: from [62.216.202.180] (helo=[192.168.178.20])
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1lJt9f-00041w-55; Wed, 10 Mar 2021 08:21:15 +0100
To: Alexandru Ardelean <aardelean@deviqon.com>
References: <20210308145502.1075689-1-aardelean@deviqon.com>
 <20210308145502.1075689-2-aardelean@deviqon.com>
 <8a6ec9a1-71f8-ce1d-600a-66eba9244a54@metafoo.de>
 <CAASAkoZ+3T27KK0HN6YikKczUFS15xSpOssaOmx4NtDQKiKvHQ@mail.gmail.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <bafbb401-d563-dafc-ff11-9fbfd33709a4@metafoo.de>
Date: Wed, 10 Mar 2021 08:21:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAASAkoZ+3T27KK0HN6YikKczUFS15xSpOssaOmx4NtDQKiKvHQ@mail.gmail.com>
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26103/Tue Mar  9 13:03:37 2021)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, ldewangan@nvidia.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, linux-spi@vger.kernel.org,
 greybus-dev@lists.linaro.org, broonie@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, vireshk@kernel.org,
 linux-tegra@vger.kernel.org, f.fainelli@gmail.com, johan@kernel.org,
 thierry.reding@gmail.com, linux@deviqon.com
Subject: Re: [greybus-dev] [PATCH 01/10] spi: spi-axi-spi-engine: remove
 usage of delay_usecs
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

T24gMy8xMC8yMSA4OjE2IEFNLCBBbGV4YW5kcnUgQXJkZWxlYW4gd3JvdGU6Cj4gT24gTW9uLCA4
IE1hciAyMDIxIGF0IDE4OjQyLCBMYXJzLVBldGVyIENsYXVzZW4gPGxhcnNAbWV0YWZvby5kZT4g
d3JvdGU6Cj4+IE9uIDMvOC8yMSAzOjU0IFBNLCBBbGV4YW5kcnUgQXJkZWxlYW4gd3JvdGU6Cj4+
PiBUaGUgJ2RlbGF5X3VzZWNzJyBmaWVsZCB3YXMgaGFuZGxlZCBmb3IgYmFja3dhcmRzIGNvbXBh
dGliaWxpdHkgaW4gY2FzZQo+Pj4gdGhlcmUgd2VyZSBzb21lIHVzZXJzIHRoYXQgc3RpbGwgY29u
ZmlndXJlZCBTUEkgZGVsYXkgdHJhbnNmZXJzIHdpdGgKPj4+IHRoaXMgZmllbGQuCj4+Pgo+Pj4g
VGhleSBzaG91bGQgYWxsIGJlIHJlbW92ZWQgYnkgbm93Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRydSBBcmRlbGVhbiA8YWFyZGVsZWFuQGRldmlxb24uY29tPgo+Pj4gLS0tCj4+PiAg
ICBkcml2ZXJzL3NwaS9zcGktYXhpLXNwaS1lbmdpbmUuYyB8IDEyICsrKystLS0tLS0tLQo+Pj4g
ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLWF4aS1zcGktZW5naW5lLmMgYi9kcml2ZXJz
L3NwaS9zcGktYXhpLXNwaS1lbmdpbmUuYwo+Pj4gaW5kZXggYWY4NmU2ZDZlMTZiLi44MGMzZTM4
ZjVjMWIgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktYXhpLXNwaS1lbmdpbmUuYwo+
Pj4gKysrIGIvZHJpdmVycy9zcGkvc3BpLWF4aS1zcGktZW5naW5lLmMKPj4+IEBAIC0xNzAsMTQg
KzE3MCwxMCBAQCBzdGF0aWMgdm9pZCBzcGlfZW5naW5lX2dlbl9zbGVlcChzdHJ1Y3Qgc3BpX2Vu
Z2luZV9wcm9ncmFtICpwLCBib29sIGRyeSwKPj4+ICAgICAgICB1bnNpZ25lZCBpbnQgdDsKPj4+
ICAgICAgICBpbnQgZGVsYXk7Cj4+Pgo+Pj4gLSAgICAgaWYgKHhmZXItPmRlbGF5X3VzZWNzKSB7
Cj4+PiAtICAgICAgICAgICAgIGRlbGF5ID0geGZlci0+ZGVsYXlfdXNlY3M7Cj4+PiAtICAgICB9
IGVsc2Ugewo+Pj4gLSAgICAgICAgICAgICBkZWxheSA9IHNwaV9kZWxheV90b19ucygmeGZlci0+
ZGVsYXksIHhmZXIpOwo+Pj4gLSAgICAgICAgICAgICBpZiAoZGVsYXkgPCAwKQo+Pj4gLSAgICAg
ICAgICAgICAgICAgICAgIHJldHVybjsKPj4+IC0gICAgICAgICAgICAgZGVsYXkgLz0gMTAwMDsK
Pj4+IC0gICAgIH0KPj4+ICsgICAgIGRlbGF5ID0gc3BpX2RlbGF5X3RvX25zKCZ4ZmVyLT5kZWxh
eSwgeGZlcik7Cj4+PiArICAgICBpZiAoZGVsYXkgPCAwKQo+Pj4gKyAgICAgICAgICAgICByZXR1
cm47Cj4+IEJpdCBvZiBhIG5pdCwgYnV0IHRoaXMgY291bGQgYmUgYGRlbGF5IDw9IDBgIGFuZCB0
aGVuIGRyb3AgdGhlIGNoZWNrIGZvcgo+PiBgZGVsYXkgPT0gMGAgYmVsb3cuCj4gaG1tLCB0aGF0
J3MgYSBiaXQgZGViYXRhYmxlLCBiZWNhdXNlIHRoZSBgZGVsYXkgPT0gMGAgY2hlY2sgY29tZXMK
PiBhZnRlciBgZGVsYXkgLz0gMTAwMGAgOwo+IHRvIGRvIHdoYXQgeW91J3JlIHN1Z2dlc3Rpbmcs
IGl0IHdvdWxkIHByb2JhYmx5IG5lZWQgYQo+IERJVl9ST1VORF9VUChkZWxheSwgMTAwMCkgdG8g
bWFrZSBzdXJlIHRoYXQgZXZlbiBzdWItbWljcm9zZWNvbmQKPiBkZWxheXMgZG9uJ3QgYmVjb21l
IHplcm87CgpBaCwgdHJ1ZS4gTGV0cyBrZWVwIHRoZSBjb2RlIGFzIGl0IGlzLgoKT24gdGhlIG90
aGVyIGhhbmQgeW91IGNvdWxkIGFyZ3VlIHRoYXQgd2Ugc2hvdWxkIHJvdW5kIHVwIHRvIGVuc3Vy
ZSB0aGUgCmRlbGF5IGlzIGF0IGxlYXN0IGFzIGxvbmcgYXMgcmVxdWVzdGVkLiBCdXQgdGhhdCBp
cyBzb21ldGhpbmcgdGhhdCAKc2hvdWxkIGJlIGNoYW5nZWQgaW5kZXBlbmRlbnRseSBmcm9tIHRo
aXMgc2VyaWVzLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3Jn
Cmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
