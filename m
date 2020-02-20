Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7357B1666E9
	for <lists+greybus-dev@lfdr.de>; Thu, 20 Feb 2020 20:12:06 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A2604618CF
	for <lists+greybus-dev@lfdr.de>; Thu, 20 Feb 2020 19:12:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 950BF619DD; Thu, 20 Feb 2020 19:12:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F2D9A619DB;
	Thu, 20 Feb 2020 19:11:51 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A057E618CF
 for <greybus-dev@lists.linaro.org>; Thu, 20 Feb 2020 19:11:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8507F619D9; Thu, 20 Feb 2020 19:11:48 +0000 (UTC)
Received: from gateway23.websitewelcome.com (gateway23.websitewelcome.com
 [192.185.50.129])
 by lists.linaro.org (Postfix) with ESMTPS id C948E618CF
 for <greybus-dev@lists.linaro.org>; Thu, 20 Feb 2020 19:11:46 +0000 (UTC)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway23.websitewelcome.com (Postfix) with ESMTP id 55210A6E5
 for <greybus-dev@lists.linaro.org>; Thu, 20 Feb 2020 13:11:46 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 4rEgj4Ll1vBMd4rEgj1Ohj; Thu, 20 Feb 2020 13:11:46 -0600
X-Authority-Reason: nr=8
Received: from [201.144.174.47] (port=20829 helo=[192.168.43.131])
 by gator4166.hostgator.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1j4rEf-002Fcv-Fy; Thu, 20 Feb 2020 13:11:45 -0600
To: Adham.Abozaeid@microchip.com, gregkh@linuxfoundation.org,
 vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
 elder@kernel.org, m.tretter@pengutronix.de, kernel@pengutronix.de,
 mchehab@kernel.org, Larry.Finger@lwfinger.net,
 florian.c.schilhabel@googlemail.com, Ajay.Kathat@microchip.com
References: <20200220132908.GA30501@embeddedor>
 <d331cd9c-ec57-b686-d977-c48e70415ae1@microchip.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 VtSixD1uOgytAP7RWS474w==
Message-ID: <8e9e1b59-a7a8-782e-990b-8a7023c2292d@embeddedor.com>
Date: Thu, 20 Feb 2020 13:14:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d331cd9c-ec57-b686-d977-c48e70415ae1@microchip.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linaro.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.144.174.47
X-Source-L: No
X-Exim-ID: 1j4rEf-002Fcv-Fy
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.43.131]) [201.144.174.47]:20829
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 15
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] staging: Replace zero-length array with
 flexible-array member
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

SGksCgpPbiAyLzIwLzIwIDEzOjA0LCBBZGhhbS5BYm96YWVpZEBtaWNyb2NoaXAuY29tIHdyb3Rl
Ogo+IEhpIEd1c3Rhdm8KPiAKPiBPbiAyLzIwLzIwIDY6MjkgQU0sIEd1c3Rhdm8gQS4gUi4gU2ls
dmEgd3JvdGU6Cj4+IFRoZSBjdXJyZW50IGNvZGViYXNlIG1ha2VzIHVzZSBvZiB0aGUgemVyby1s
ZW5ndGggYXJyYXkgbGFuZ3VhZ2UKPj4gZXh0ZW5zaW9uIHRvIHRoZSBDOTAgc3RhbmRhcmQsIGJ1
dCB0aGUgcHJlZmVycmVkIG1lY2hhbmlzbSB0byBkZWNsYXJlCj4+IHZhcmlhYmxlLWxlbmd0aCB0
eXBlcyBzdWNoIGFzIHRoZXNlIG9uZXMgaXMgYSBmbGV4aWJsZSBhcnJheSBtZW1iZXJbMV1bMl0s
Cj4+IGludHJvZHVjZWQgaW4gQzk5Ogo+Pgo+PiBzdHJ1Y3QgZm9vIHsKPj4gICAgICAgICBpbnQg
c3R1ZmY7Cj4+ICAgICAgICAgc3RydWN0IGJvbyBhcnJheVtdOwo+PiB9Owo+Pgo+PiBCeSBtYWtp
bmcgdXNlIG9mIHRoZSBtZWNoYW5pc20gYWJvdmUsIHdlIHdpbGwgZ2V0IGEgY29tcGlsZXIgd2Fy
bmluZwo+PiBpbiBjYXNlIHRoZSBmbGV4aWJsZSBhcnJheSBkb2VzIG5vdCBvY2N1ciBsYXN0IGlu
IHRoZSBzdHJ1Y3R1cmUsIHdoaWNoCj4+IHdpbGwgaGVscCB1cyBwcmV2ZW50IHNvbWUga2luZCBv
ZiB1bmRlZmluZWQgYmVoYXZpb3IgYnVncyBmcm9tIGJlaW5nCj4+IGluYWR2ZXJ0ZW50bHkgaW50
cm9kdWNlZFszXSB0byB0aGUgY29kZWJhc2UgZnJvbSBub3cgb24uCj4+Cj4+IEFsc28sIG5vdGlj
ZSB0aGF0LCBkeW5hbWljIG1lbW9yeSBhbGxvY2F0aW9ucyB3b24ndCBiZSBhZmZlY3RlZCBieQo+
PiB0aGlzIGNoYW5nZToKPj4KPj4gIkZsZXhpYmxlIGFycmF5IG1lbWJlcnMgaGF2ZSBpbmNvbXBs
ZXRlIHR5cGUsIGFuZCBzbyB0aGUgc2l6ZW9mIG9wZXJhdG9yCj4+IG1heSBub3QgYmUgYXBwbGll
ZC4gQXMgYSBxdWlyayBvZiB0aGUgb3JpZ2luYWwgaW1wbGVtZW50YXRpb24gb2YKPj4gemVyby1s
ZW5ndGggYXJyYXlzLCBzaXplb2YgZXZhbHVhdGVzIHRvIHplcm8uIlsxXQo+Pgo+PiBUaGlzIGlz
c3VlIHdhcyBmb3VuZCB3aXRoIHRoZSBoZWxwIG9mIENvY2NpbmVsbGUuCj4+Cj4+IFsxXSBodHRw
czovL2djYy5nbnUub3JnL29ubGluZWRvY3MvZ2NjL1plcm8tTGVuZ3RoLmh0bWwKPj4gWzJdIGh0
dHBzOi8vZ2l0aHViLmNvbS9LU1BQL2xpbnV4L2lzc3Vlcy8yMQo+PiBbM10gY29tbWl0IDc2NDk3
NzMyOTMyZiAoImN4Z2IzL2wydDogRml4IHVuZGVmaW5lZCBiZWhhdmlvdXIiKQo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgo+
Pgo+PiAgc3RhdGljIHZvaWQgY2ZnX3NjYW5fcmVzdWx0KGVudW0gc2Nhbl9ldmVudCBzY2FuX2V2
ZW50LAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL3dpbGMxMDAwL3NwaS5jIGIvZHJp
dmVycy9zdGFnaW5nL3dpbGMxMDAwL3NwaS5jCj4+IGluZGV4IDQ0ZjdkNDg4NTFiNS4uMTE2NTNh
YzExOGNkIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvd2lsYzEwMDAvc3BpLmMKPj4g
KysrIGIvZHJpdmVycy9zdGFnaW5nL3dpbGMxMDAwL3NwaS5jCj4+IEBAIC0xMzksNyArMTM5LDcg
QEAgc3RydWN0IHdpbGNfc3BpX3JlYWRfcnNwX2RhdGEgewo+PiAgICAgICAgIHU4IHN0YXR1czsK
Pj4gICAgICAgICB1OCByZXNwX2hlYWRlcjsKPj4gICAgICAgICB1OCByZXNwX2RhdGFbNF07Cj4+
IC0gICAgICAgdTggY3JjWzBdOwo+PiArICAgICAgIHU4IGNyY1tdOwo+PiAgfSBfX3BhY2tlZDsK
PiBtb3JlIHplcm8tbGVuZ3RoIGFycmF5cyBpbiB3aWxjMTAwMCwgc3BpLmMsIHN0cnVjdCB3aWxj
X3NwaV9jbWQsIGFuZCBpbiBmdy5oCj4gCgpPaCB3b3csIEkgaGFkbid0IHRob3VnaHQgYWJvdXQg
Y2FzZXMgbGlrZSB0aGlzOgoKc3RydWN0IHdpbGNfc3BpX2NtZCB7CiAgICAgICAgdTggY21kX3R5
cGU7CiAgICAgICAgdW5pb24gewogICAgICAgICAgICAgICAgc3RydWN0IHsKICAgICAgICAgICAg
ICAgICAgICAgICAgdTggYWRkclszXTsKICAgICAgICAgICAgICAgICAgICAgICAgdTggY3JjWzBd
OwogICAgICAgICAgICAgICAgfSBfX3BhY2tlZCBzaW1wbGVfY21kOwogICAgICAgICAgICAgICAg
c3RydWN0IHsKICAgICAgICAgICAgICAgICAgICAgICAgdTggYWRkclszXTsKICAgICAgICAgICAg
ICAgICAgICAgICAgdTggc2l6ZVsyXTsKICAgICAgICAgICAgICAgICAgICAgICAgdTggY3JjWzBd
OwogICAgICAgICAgICAgICAgfSBfX3BhY2tlZCBkbWFfY21kOwogICAgICAgICAgICAgICAgc3Ry
dWN0IHsKICAgICAgICAgICAgICAgICAgICAgICAgdTggYWRkclszXTsKICAgICAgICAgICAgICAg
ICAgICAgICAgdTggc2l6ZVszXTsKICAgICAgICAgICAgICAgICAgICAgICAgdTggY3JjWzBdOwog
ICAgICAgICAgICAgICAgfSBfX3BhY2tlZCBkbWFfY21kX2V4dDsKICAgICAgICAgICAgICAgIHN0
cnVjdCB7CiAgICAgICAgICAgICAgICAgICAgICAgIHU4IGFkZHJbMl07CiAgICAgICAgICAgICAg
ICAgICAgICAgIF9fYmUzMiBkYXRhOwogICAgICAgICAgICAgICAgICAgICAgICB1OCBjcmNbMF07
CiAgICAgICAgICAgICAgICB9IF9fcGFja2VkIGludGVybmFsX3dfY21kOwogICAgICAgICAgICAg
ICAgc3RydWN0IHsKICAgICAgICAgICAgICAgICAgICAgICAgdTggYWRkclszXTsKICAgICAgICAg
ICAgICAgICAgICAgICAgX19iZTMyIGRhdGE7CiAgICAgICAgICAgICAgICAgICAgICAgIHU4IGNy
Y1swXTsKICAgICAgICAgICAgICAgIH0gX19wYWNrZWQgd19jbWQ7CiAgICAgICAgfSB1Owp9IF9f
cGFja2VkOwoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suCi0tCkd1c3Rhdm8KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBs
aXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3Jn
L21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
