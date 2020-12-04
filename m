Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B70EF2CF384
	for <lists+greybus-dev@lfdr.de>; Fri,  4 Dec 2020 19:03:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E550366706
	for <lists+greybus-dev@lfdr.de>; Fri,  4 Dec 2020 18:03:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id BED3566703; Fri,  4 Dec 2020 18:03:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2813966702;
	Fri,  4 Dec 2020 18:03:28 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C8E12666FF
 for <greybus-dev@lists.linaro.org>; Fri,  4 Dec 2020 18:03:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id AF55666701; Fri,  4 Dec 2020 18:03:25 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by lists.linaro.org (Postfix) with ESMTPS id 89943666FF
 for <greybus-dev@lists.linaro.org>; Fri,  4 Dec 2020 18:03:24 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 131so4248778pfb.9
 for <greybus-dev@lists.linaro.org>; Fri, 04 Dec 2020 10:03:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e+Njf8NG6+fsYlsC9GMzSFpNhGjLZL8pv+AFfjpqRlM=;
 b=R9d+bhPPYiHLtnlhlSU00Z5eobyn7R9xIUvFQWtOAr5nzEbuaF8Pp2WsdAcMn1Yhw9
 Zs/rjM+3Bm/z3EfDdY4HeQQ7pdQiK/XTvkQNjgbTjC08EAupIbF89Pj7Ss1I8axI137r
 umhyK/9BIbHeplinIibYj8sYuk6ZDo2br+8MhCYw2SRyR/4wU/Pf8ovYvu2w4bTn63R7
 R5gfRWZ950aT7Y9XWoTiLrd8ziGvTcgRKgUIxe9IeHcNLwpKqNbVN5E0awUR2GTO+y6+
 kYBe/X7KwJpl9jqOArXoq+xh35GoAaMptoExyKmod6kBLSTcKUsJklKYRiwO5xqAbA9c
 pcHQ==
X-Gm-Message-State: AOAM533Tyf4XsMnC1oa7iZPhqS/8+/Mqr//Dc3kFuoVuTkXDYElF/bzt
 G/412CtDPdxTcRn+NBRvtuCtCPZPYpmZqEzU3MA=
X-Google-Smtp-Source: ABdhPJz7nytvFUT2W0TzpKWPiz61juYOJk4Dt8QM4Alw2rykoKdUZPIvH1HRfiCHM2FWX0c4pW0jDD9CFa7iY959HrI=
X-Received: by 2002:aa7:9414:0:b029:18c:23f6:bc6d with SMTP id
 x20-20020aa794140000b029018c23f6bc6dmr4922931pfo.21.1607105003635; Fri, 04
 Dec 2020 10:03:23 -0800 (PST)
MIME-Version: 1.0
References: <20201204021350.28182-1-wanghai38@huawei.com>
 <X8n2CL58pQ/077rQ@localhost>
In-Reply-To: <X8n2CL58pQ/077rQ@localhost>
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Fri, 4 Dec 2020 23:32:47 +0530
Message-ID: <CAAs3649kGerXZqgffwethn-JNOiiFSif1COM3no4Az4Ah220VA@mail.gmail.com>
To: Johan Hovold <johan@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Wang Hai <wanghai38@huawei.com>,
 Alex Elder <elder@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 aibhav.sr@gmail.com,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gRnJpLCBEZWMgNCwgMjAyMCBhdCAyOjEwIFBNIEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIERlYyAwNCwgMjAyMCBhdCAxMDoxMzo1MEFNICswODAw
LCBXYW5nIEhhaSB3cm90ZToKPiA+IEFkZCB0aGUgbWlzc2luZyB1bmxvY2sgYmVmb3JlIHJldHVy
biBmcm9tIGZ1bmN0aW9uCj4gPiBnYmF1ZGlvX2RhcG1fZnJlZV9jb250cm9scygpIGluIHRoZSBl
cnJvciBoYW5kbGluZyBjYXNlLgo+ID4KPiA+IEZpeGVzOiA1MTBlMzQwZWZlMGMgKCJzdGFnaW5n
OiBncmV5YnVzOiBhdWRpbzogQWRkIGhlbHBlciBBUElzIGZvciBkeW5hbWljIGF1ZGlvIG1vZHVs
ZSIpCj4gPiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBXYW5nIEhhaSA8d2FuZ2hhaTM4QGh1YXdlaS5jb20+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYyB8IDEgKwo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1
ZGlvX2hlbHBlci5jCj4gPiBpbmRleCAyMzc1MzFiYTYwZjMuLjI5MzY3NWRiZWExMCAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jCj4gPiArKysg
Yi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYwo+ID4gQEAgLTEzNSw2ICsx
MzUsNyBAQCBpbnQgZ2JhdWRpb19kYXBtX2ZyZWVfY29udHJvbHMoc3RydWN0IHNuZF9zb2NfZGFw
bV9jb250ZXh0ICpkYXBtLAo+ID4gICAgICAgICAgICAgICBpZiAoIXcpIHsKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICBkZXZfZXJyKGRhcG0tPmRldiwgIiVzOiB3aWRnZXQgbm90IGZvdW5kXG4i
LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgd2lkZ2V0LT5uYW1lKTsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBtdXRleF91bmxvY2soJmRhcG0tPmNhcmQtPmRhcG1fbXV0ZXgp
Owo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gICAgICAgICAg
ICAgICB9Cj4gPiAgICAgICAgICAgICAgIHdpZGdldCsrOwo+Cj4gVGhpcyBzdXBlcmZpY2lhbGx5
IGxvb2tzIGNvcnJlY3QsIGJ1dCB0aGVyZSBzZWVtcyB0byBiZSBhbm90aGVyIGJ1ZyBpbgo+IHRo
aXMgZnVuY3Rpb24uIEl0IGNhbiBiZSB1c2VkIGZyZWUgYW4gYXJyYXkgb2Ygd2lkZ2V0cywgYnV0
IGlmIG9uZSBvZgo+IHRoZW0gaXNuJ3QgZm91bmQgd2UganVzdCBsZWFrIHRoZSByZXN0LiBQZXJo
YXBzIHRoYXQgcmV0dXJuIHNob3VsZAo+IHJhdGhlciBiZSAid2lkZ2V0Kys7IGNvbnRpbnVlOyIu
Cj4KPiBWYWliaGF2PwoKVGhhbmtzIFdhbmcgZm9yIHNoYXJpbmcgdGhlIHBhdGNoLiBBcyBhbHJl
YWR5IHBvaW50ZWQgYnkgSm9oYW4sIHRoaXMKZnVuY3Rpb24gaW5kZWVkIGhhcyBhbm90aGVyIGJ1
ZyBhcyB3ZWxsLgpQbHMgZmVlbCBmcmVlIHRvIHNoYXJlIHRoZSBwYXRjaCBhcyBzdWdnZXN0ZWQg
YWJvdmUuCgotLQp2YWliaGF2Cgo+Cj4gSm9oYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2
QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGlu
Zm8vZ3JleWJ1cy1kZXYK
