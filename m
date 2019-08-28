Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CE5A002F
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 12:47:47 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4396360190
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 10:47:46 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3367D609D6; Wed, 28 Aug 2019 10:47:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 231966162E;
	Wed, 28 Aug 2019 10:47:36 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 0129960190
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 10:47:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D07B760BDE; Wed, 28 Aug 2019 10:47:33 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by lists.linaro.org (Postfix) with ESMTPS id D17DF60190
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 10:47:32 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id r5so1752318lfc.3
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 03:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=y0iC0f2n/zIRNJR2gyQYU5+x6TeYT9E/x6lXjQ1LAII=;
 b=NSwQ0AKiF6iqHb3rLPQG9eyEKtkMWmWkCmvH83X7mVqglWmCYFmSkqq7F3cr1y+15e
 RkfI0lFG0dOTNgSOIKch4ODHvUtV/uAawjLGe2S8CF0DVQxe99zKhpcJLCk6j3ED2FUJ
 x1SheVodRtJUH94Ujrnpu3lsBYeo1RCWozvnhE35igD2DD421zzzXWPbiaEgHDRTEoEs
 uQo5QInXyRytB61KsoNwo7ya6BxVsOwQA6gbRrKQJ78X5R8jAhXOj5eKGlI/Zp5Sv6tm
 96z3r4m3MOoTJPZv74ce2KDRHfG53wRbC9RPueHyGMHUub8x/UR0hgui/RDFn4VjjnG/
 asQg==
X-Gm-Message-State: APjAAAWDnETUBNncy+MX0uIkTV1DpNZiV1aoD50dlo+AturmxNgCo7kH
 06aykiZSSUfVWSzWuLrr1eQ=
X-Google-Smtp-Source: APXvYqxJgfpUo0xrtc8I8RwU+Kanigw3VId26kkDpyLvPjXT52gxRpBZnwpoTYiTb36d1LfGCAdEkw==
X-Received: by 2002:a05:6512:40c:: with SMTP id
 u12mr1667503lfk.67.1566989251620; 
 Wed, 28 Aug 2019 03:47:31 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se.
 [85.224.241.81])
 by smtp.gmail.com with ESMTPSA id d16sm784522lfi.31.2019.08.28.03.47.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Aug 2019 03:47:30 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
 (envelope-from <johan@kernel.org>)
 id 1i2vU6-00057l-Ok; Wed, 28 Aug 2019 12:47:27 +0200
Date: Wed, 28 Aug 2019 12:47:26 +0200
From: Johan Hovold <johan@kernel.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Message-ID: <20190828104726.GE13017@localhost>
References: <20190828102859.13180-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190828102859.13180-1-rui.silva@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 kbuild test robot <lkp@intel.com>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fix more header includes
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

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTE6Mjg6NTlBTSArMDEwMCwgUnVpIE1pZ3VlbCBTaWx2
YSB3cm90ZToKPiBNb3JlIGhlYWRlcnMgbmVlZGVkIHRvIGJlIGZpeGVkIHdoZW4gbW92aW5nIGdy
ZXlidXMgb3V0IG9mIHN0YWdpbmcgYW5kCj4gZW5hYmxpbmcgdGhlIENPTVBJTEVfVEVTVCBvcHRp
b24uCj4gCj4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IFJ1aSBNaWd1ZWwgU2lsdmEgPHJ1aS5zaWx2YUBsaW5hcm8ub3JnPgo+
IC0tLQo+ICBpbmNsdWRlL2xpbnV4L2dyZXlidXMvb3BlcmF0aW9uLmggfCAxICsKPiAgaW5jbHVk
ZS9saW51eC9ncmV5YnVzL3N2Yy5oICAgICAgIHwgMiArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2dyZXlidXMvb3Bl
cmF0aW9uLmggYi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvb3BlcmF0aW9uLmgKPiBpbmRleCA4Y2E4
NjRiYmEyM2UuLmJmYmM1NmQ4ZDg2MyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2dyZXli
dXMvb3BlcmF0aW9uLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvb3BlcmF0aW9uLmgK
PiBAQCAtMTUsNiArMTUsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L3dvcmtxdWV1ZS5oPgo+ICAKPiArI2luY2x1ZGUgImhkLmgiCgpObyBuZWVkIHRv
IGluY2x1ZGUgaGQuaCwgeW91IG9ubHkgbmVlZCBhIGZvcndhcmQgZGVjbGFyYXRpb24gb2Ygc3Ry
dWN0CmdiX2hvc3RfZGV2aWNlLgoKPiAgc3RydWN0IGdiX29wZXJhdGlvbjsKPiAgCj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9zdmMuaCBiL2luY2x1ZGUvbGludXgvZ3JleWJ1
cy9zdmMuaAo+IGluZGV4IDUwN2Y4YmQ0ZTRjOC4uMTFhODY1MDRjNDI5IDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvbGludXgvZ3JleWJ1cy9zdmMuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvZ3JleWJ1
cy9zdmMuaAo+IEBAIC0xMiw2ICsxMiw4IEBACj4gICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+
ICAjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+Cj4gIAo+ICsjaW5jbHVkZSAiZ3JleWJ1c19wcm90
b2NvbHMuaCIKClNhbWUgaGVyZSwgbm8gbmVlZCB0byBpbmNsdWRlIGFsbCB0aGUgcHJvdG9jb2wg
ZGVmaW5pdGlvbnMgZm9yIHN0cnVjdApnYl9zdmNfbDJfdGltZXJfY2ZnLgoKPiArCj4gICNkZWZp
bmUgR0JfU1ZDX0NQT1JUX0ZMQUdfRTJFRkMJCUJJVCgwKQo+ICAjZGVmaW5lIEdCX1NWQ19DUE9S
VF9GTEFHX0NTRF9OCQlCSVQoMSkKPiAgI2RlZmluZSBHQl9TVkNfQ1BPUlRfRkxBR19DU1ZfTgkJ
QklUKDIpCgpKb2hhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9y
ZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
