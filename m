Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE9519DA53
	for <lists+greybus-dev@lfdr.de>; Fri,  3 Apr 2020 17:37:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1B7626162C
	for <lists+greybus-dev@lfdr.de>; Fri,  3 Apr 2020 15:37:41 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 109BE61667; Fri,  3 Apr 2020 15:37:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,HK_RANDOM_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 83B6D61655;
	Fri,  3 Apr 2020 15:37:36 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4BB01608EC
 for <greybus-dev@lists.linaro.org>; Thu,  2 Apr 2020 13:16:24 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4025760F1F; Thu,  2 Apr 2020 13:16:24 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by lists.linaro.org (Postfix) with ESMTPS id 131CA608EC
 for <greybus-dev@lists.linaro.org>; Thu,  2 Apr 2020 13:16:23 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id 65so4193047wrl.1
 for <greybus-dev@lists.linaro.org>; Thu, 02 Apr 2020 06:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+Fq/Eghn+1NfjLYFOkcULDqoL6yltxz4HaQ8BR6dhF4=;
 b=OR7e9AhODekFSv0PL7BNQRuMTwxh+j3bfgz08KiINQrjxBXnK+gMDpAVL04zkVUukY
 6H/pW2UAFcjsRO/pen1zhXUOBLmqRhLg5IwVaFW12g1R1OHIjoMjl0wcApkVs2n3woDx
 +L9TO1mVcKfmdljaUgZO3dz3PDahfwGJ4lcIIOVDxn4Ax/+YMABM+Pll/KaQx6Usu6XY
 GST1ikDT3m8wJxp4zO50k7E/LuKnppUgju68y1ecXHGan0CW3WTy+NidGmYwwzValuwL
 CRkVMzPYFEZ5luDhv/k/YuP08ek6Rx+o1hUoDoelfD5wyIjFY3CGVP9NcK1VtCNQxDxq
 2Lfg==
X-Gm-Message-State: AGi0PuYuGhRnbGrjClgdA7DKV8uoNDg3E7GtE60o+gGKColW10qSpr53
 Y6lTCYYn/2TiBxrN4r18l38=
X-Google-Smtp-Source: APiQypIf6Ox3JWNLzTW5xz11z6IiJ42yBb5OEa/OTgAZ3d4kO0KMBXDPoOvBmm01icTzk30Vzq7Ofw==
X-Received: by 2002:adf:e74b:: with SMTP id c11mr3357240wrn.136.1585833382200; 
 Thu, 02 Apr 2020 06:16:22 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt.
 [109.49.46.234])
 by smtp.gmail.com with ESMTPSA id j135sm7412272wmj.46.2020.04.02.06.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 06:16:21 -0700 (PDT)
Date: Thu, 2 Apr 2020 14:16:18 +0100
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200402131618.653dkeuz7c2vuujf@arch-thunder.localdomain>
References: <20200401030017.100274-1-chenzhou10@huawei.com>
 <20200402122228.GP2001@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200402122228.GP2001@kadam>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org,
 Chen Zhou <chenzhou10@huawei.com>, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH -next] staging: greybus: fix a
 missing-check bug in gb_lights_light_config()
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

SGkgRGFuLAoKT24gVGh1LCBBcHIgMDIsIDIwMjAgYXQgMDM6MjI6MjhQTSArMDMwMCwgRGFuIENh
cnBlbnRlciB3cm90ZToKPiBPbiBXZWQsIEFwciAwMSwgMjAyMCBhdCAxMTowMDoxN0FNICswODAw
LCBDaGVuIFpob3Ugd3JvdGU6Cj4gPiBJbiBnYl9saWdodHNfbGlnaHRfY29uZmlnKCksICdsaWdo
dC0+bmFtZScgaXMgYWxsb2NhdGVkIGJ5IGtzdHJuZHVwKCkuCj4gPiBJdCByZXR1cm5zIE5VTEwg
d2hlbiBmYWlscywgYWRkIGNoZWNrIGZvciBpdC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQ2hl
biBaaG91IDxjaGVuemhvdTEwQGh1YXdlaS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9saWdodC5jIHwgMyArKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9saWdodC5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbGlnaHQuYwo+ID4g
aW5kZXggZDZiYTI1Zi4uZDI2NzJiNiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2xpZ2h0LmMKPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xpZ2h0LmMK
PiA+IEBAIC0xMDI2LDcgKzEwMjYsOCBAQCBzdGF0aWMgaW50IGdiX2xpZ2h0c19saWdodF9jb25m
aWcoc3RydWN0IGdiX2xpZ2h0cyAqZ2xpZ2h0cywgdTggaWQpCj4gPiAgCj4gPiAgCWxpZ2h0LT5j
aGFubmVsc19jb3VudCA9IGNvbmYuY2hhbm5lbF9jb3VudDsKPiA+ICAJbGlnaHQtPm5hbWUgPSBr
c3RybmR1cChjb25mLm5hbWUsIE5BTUVTX01BWCwgR0ZQX0tFUk5FTCk7Cj4gPiAtCj4gPiArCWlm
ICghbGlnaHQtPm5hbWUpCj4gPiArCQlyZXR1cm4gLUVOT01FTTsKPiA+ICAJbGlnaHQtPmNoYW5u
ZWxzID0ga2NhbGxvYyhsaWdodC0+Y2hhbm5lbHNfY291bnQsCj4gPiAgCQkJCSAgc2l6ZW9mKHN0
cnVjdCBnYl9jaGFubmVsKSwgR0ZQX0tFUk5FTCk7Cj4gPiAgCWlmICghbGlnaHQtPmNoYW5uZWxz
KQo+IAo+IFRoZSBjbGVhbiB1cCBpbiB0aGlzIGZ1bmN0aW9uIGlzIG5vbi1leGlzdGFudC4gIDoo
CgpZZWFoLCB0aGlzIGhhdmUgYSBjZW50cmFsIHBvaW50IHRvIGRvIHRoZSBjbGVhbnVwcywgZ2Jf
bGlnaHRzX3JlbGVhc2UsCnNpbmNlIHdlIG1heSBoYXZlIG90aGVyIGxpZ2h0cyBhbHJlYWR5IGNv
bmZpZ3VyZWQgYXQgdGhpcyBwb2ludCwgd2UKY291bGQgY2xlYW51cCB0aGlzIHNwZWNpZmljIG9u
ZSBoZXJlLCBidXQgdGhhbiB3b3VsZCBuZWVkIHRvIG1ha2Ugc3VyZQphbGwgb3RoZXIgYWxyZWFk
eSBjb25maWd1cmUgZ290IGNsZWFuIGFsc28uCgotLS0tLS0KQ2hlZXJzLAogICAgIFJ1aQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYg
bWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5s
aW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
