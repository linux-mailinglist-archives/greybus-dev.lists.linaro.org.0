Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id A91D719DA63
	for <lists+greybus-dev@lfdr.de>; Fri,  3 Apr 2020 17:43:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C14AF61655
	for <lists+greybus-dev@lfdr.de>; Fri,  3 Apr 2020 15:43:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B5A2F61720; Fri,  3 Apr 2020 15:43:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,HK_RANDOM_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D2A6F61839;
	Fri,  3 Apr 2020 15:42:39 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2CA7560631
 for <greybus-dev@lists.linaro.org>; Thu,  2 Apr 2020 16:04:06 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 0BE4D6088B; Thu,  2 Apr 2020 16:04:06 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by lists.linaro.org (Postfix) with ESMTPS id F251E60631
 for <greybus-dev@lists.linaro.org>; Thu,  2 Apr 2020 16:04:04 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g3so2580801wrx.2
 for <greybus-dev@lists.linaro.org>; Thu, 02 Apr 2020 09:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qBVTjaLThJfumgo5ABo1WV3ZM7MbrBwLw7tmH+TZCSg=;
 b=S/Ei2PTkVhAUZ4tqSp9BqIsY65KcNfRNsWsJYplWNbUlq6VYu7CzHspWXC7zXCuOlf
 8tVg0hAFWacuEi5hqTXPQLq/6N+fH2nIWZFGmcQ5iP/b7BclbaqXJnpFA5ieh/Wgqwe+
 02c+mhLdEDNCtO7O4eY+rBYO4kKtH4sMMeJanKXC533NSHrn/kN7awSxzLsoXIpJXFte
 ti5z+eOr1NvzdZ9/qEGxv1aadOLl40yz+3pgEOtD7FZFhNy2bYq4vJHGLQGCnwNP/Nw9
 wuH06e1Y3Iq3Uc8132/u+0kjTFCYvn4mzX7egRAzWFHLLIK1UAvjfjpCvX/vA2FZw7Hb
 j/Uw==
X-Gm-Message-State: AGi0Pub3GQP5gRS5SCfCoSNsV6m9Jnoi5c8wz/INbJv5JMTFb5Ao5BFa
 ap5Hmea4tB+QcAh58nRjzQQ=
X-Google-Smtp-Source: APiQypKxE40isqGXPYBa29scB1z8vPhNWxo1K4pgf8KCxsrh4y/cdK44Lrxa6WgqgtI8QdSesWLArg==
X-Received: by 2002:a5d:4602:: with SMTP id t2mr4567354wrq.347.1585843444033; 
 Thu, 02 Apr 2020 09:04:04 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt.
 [109.49.46.234])
 by smtp.gmail.com with ESMTPSA id y16sm7988816wrp.78.2020.04.02.09.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 09:04:03 -0700 (PDT)
Date: Thu, 2 Apr 2020 17:04:00 +0100
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200402160400.cvgvd3da75x2f4qe@arch-thunder.localdomain>
References: <20200401030017.100274-1-chenzhou10@huawei.com>
 <20200402122228.GP2001@kadam>
 <20200402131618.653dkeuz7c2vuujf@arch-thunder.localdomain>
 <20200402142237.GT2001@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200402142237.GT2001@kadam>
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

SGksCk9uIFRodSwgQXByIDAyLCAyMDIwIGF0IDA1OjIyOjM3UE0gKzAzMDAsIERhbiBDYXJwZW50
ZXIgd3JvdGU6Cj4gT24gVGh1LCBBcHIgMDIsIDIwMjAgYXQgMDI6MTY6MThQTSArMDEwMCwgUnVp
IE1pZ3VlbCBTaWx2YSB3cm90ZToKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9saWdodC5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbGlnaHQuYwo+
ID4gPiA+IEBAIC0xMDI2LDcgKzEwMjYsOCBAQCBzdGF0aWMgaW50IGdiX2xpZ2h0c19saWdodF9j
b25maWcoc3RydWN0IGdiX2xpZ2h0cyAqZ2xpZ2h0cywgdTggaWQpCj4gPiA+ID4gIAo+ID4gPiA+
ICAJbGlnaHQtPmNoYW5uZWxzX2NvdW50ID0gY29uZi5jaGFubmVsX2NvdW50Owo+ID4gPiA+ICAJ
bGlnaHQtPm5hbWUgPSBrc3RybmR1cChjb25mLm5hbWUsIE5BTUVTX01BWCwgR0ZQX0tFUk5FTCk7
Cj4gPiA+ID4gLQo+ID4gPiA+ICsJaWYgKCFsaWdodC0+bmFtZSkKPiA+ID4gPiArCQlyZXR1cm4g
LUVOT01FTTsKPiA+ID4gPiAgCWxpZ2h0LT5jaGFubmVscyA9IGtjYWxsb2MobGlnaHQtPmNoYW5u
ZWxzX2NvdW50LAo+ID4gPiA+ICAJCQkJICBzaXplb2Yoc3RydWN0IGdiX2NoYW5uZWwpLCBHRlBf
S0VSTkVMKTsKPiA+ID4gPiAgCWlmICghbGlnaHQtPmNoYW5uZWxzKQo+ID4gPiAKPiA+ID4gVGhl
IGNsZWFuIHVwIGluIHRoaXMgZnVuY3Rpb24gaXMgbm9uLWV4aXN0YW50LiAgOigKPiA+IAo+ID4g
WWVhaCwgdGhpcyBoYXZlIGEgY2VudHJhbCBwb2ludCB0byBkbyB0aGUgY2xlYW51cHMsIGdiX2xp
Z2h0c19yZWxlYXNlLAo+ID4gc2luY2Ugd2UgbWF5IGhhdmUgb3RoZXIgbGlnaHRzIGFscmVhZHkg
Y29uZmlndXJlZCBhdCB0aGlzIHBvaW50LCB3ZQo+ID4gY291bGQgY2xlYW51cCB0aGlzIHNwZWNp
ZmljIG9uZSBoZXJlLCBidXQgdGhhbiB3b3VsZCBuZWVkIHRvIG1ha2Ugc3VyZQo+ID4gYWxsIG90
aGVyIGFscmVhZHkgY29uZmlndXJlIGdvdCBjbGVhbiBhbHNvLgo+IAo+IENlbnRyYWwgY2xlYW4g
dXAgZnVuY3Rpb25zIG5ldmVyIHdvcmsgY29ycmVjdGx5LgoKSSBhZ3JlZS4KCj4gCj4gRm9yIGV4
YW1wbGUsIHdlIGFsbG9jYXRlICJjZGV2LT5uYW1lIiBpbiBnYl9saWdodHNfY2hhbm5lbF9jb25m
aWcoKQo+IGJlZm9yZSB3ZSByZWdpc3RlciB0aGUgY2hhbm5lbCBsYXRlciBpbiBnYl9saWdodHNf
cmVnaXN0ZXJfYWxsKGdsaWdodHMpOy4KPiBOb3cgaW1hZ2luZSB0aGF0IHRoZSByZWdpc3RlciBm
YWlscy4gIFRoZW4gd2hlbiB3ZSdyZSBmcmVlaW5nIGl0IGluCj4gX19nYl9saWdodHNfbGVkX3Vu
cmVnaXN0ZXIoKSB3ZSBzZWUgdGhhdCB0aGUgLT5pc19yZWdpc3RlcmVkIGlzIGZhbHNlCj4gc28g
d2UgZG9uJ3Qga2ZyZWUoY2Rldi0+bmFtZSkuCj4gCj4gVGhhdCdzIGp1c3QgYSBzbWFsbCBtZW1v
cnkgbGVhay4gIEJ1dCB0aGVyZSBhcmUgZ29pbmcgdG8gYmUgdG9ucyBvZgo+IGxpdHRsZSBidWdz
IGxpa2UgdGhhdC4KClllYWgsIHdoZW4gSSBoYXZlIHNvbWUgY3ljbGVzIEknbGwgZ28gb3ZlciB0
aGF0IGVycm9yIGNvZGVzIHBhdGhzIGFuZAptaXRpZ2F0ZSB0aGlzIGtpbmQgb2YgaXNzdWVzLgoK
PiAKPiBBbnl3YXkgaXQgZG9lc24ndCBhZmZlY3QgdGhpcyBwYXRjaCBzbyBpdCdzIGZpbmUuCgpZ
ZWFoLCB0aGFua3MuCgotLS0tLS0KQ2hlZXJzLAogICAgIFJ1aQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3Jl
eWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1h
bi9saXN0aW5mby9ncmV5YnVzLWRldgo=
