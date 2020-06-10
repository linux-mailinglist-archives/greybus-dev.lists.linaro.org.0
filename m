Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CCF1F5B4F
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2020 20:36:59 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 48607664E3
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2020 18:36:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 33AF9664DF; Wed, 10 Jun 2020 18:36:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,FSL_HELO_FAKE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BA02C65F72;
	Wed, 10 Jun 2020 18:36:45 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BF94761915
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 18:36:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id AF0A765F72; Wed, 10 Jun 2020 18:36:42 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by lists.linaro.org (Postfix) with ESMTPS id 680A561915
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 18:36:41 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id t7so1353000pgt.3
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 11:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yw3q9eI6lwTKHkfbX8g8ks9O/Eo9T2Je00bLzcJ2GYc=;
 b=hERXlgRVfwynDlKX7T/Jma1ASSoa2LpuoYi5v7U8jZty9DwOLGMYyXqZibX0FRh6Vp
 Q2O0NrkZw7jJetasWe0qYff0NyuOa3OPv1ja3Kyo/2SWZ9htbRp3WBOcpQjzreMzEl1d
 Qu6gc06m5U0bTupHc5QPBjHnAhLlOGAH1kLKJKVBG+uA++kTrXpYVxQvXkzXDui1PWRO
 DKtkYekQ/FzI0+/8WVf9R/hUQ8VeLhr8GXbzRffjohMREtKZ4+ObUISBACU/zoh/aN6U
 1EJ+c6CBoGwE6ccZCZJgCI6q5Yogku2COYUIkMeyZDsXtg10vOHQjAJFmqLKFIID1NB2
 S5Bg==
X-Gm-Message-State: AOAM531wRWceh2RGLz07lelW2X/UxbZ5r0th4g8qiuwubF5ndzIlEF3T
 31iYcKBbQ2wk6vZ0hk/iJPE=
X-Google-Smtp-Source: ABdhPJx9yBS3TpsCYB0M2k/HUJCqFbrfJDrQFqu6V3G1g3niXzTVJlGN/tj/FlKmZYYb2YwY0BjsVg==
X-Received: by 2002:a63:c04b:: with SMTP id z11mr3760360pgi.215.1591814200411; 
 Wed, 10 Jun 2020 11:36:40 -0700 (PDT)
Received: from gmail.com ([192.55.54.40])
 by smtp.gmail.com with ESMTPSA id p31sm483529pgb.46.2020.06.10.11.36.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2020 11:36:39 -0700 (PDT)
Date: Thu, 11 Jun 2020 00:06:32 +0530
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200610183630.GA26807@gmail.com>
References: <cover.1591802243.git.vaibhav.sr@gmail.com>
 <7cbb81585474e895faa842e2af05ec3fb2079386.1591802243.git.vaibhav.sr@gmail.com>
 <20200610174535.GB4151@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200610174535.GB4151@kadam>
User-Agent: Mutt/1.10.1+3 (f9293d646485) (2018-09-22)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, greybus-dev@lists.linaro.org,
 Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH v2 4/6] staging: greybus: audio: Resolve
 compilation error in topology parser
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

T24gV2VkLCBKdW4gMTAsIDIwMjAgYXQgMDg6NDU6MzVQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBPbiBXZWQsIEp1biAxMCwgMjAyMCBhdCAxMDo1ODoyOFBNICswNTMwLCBWYWliaGF2
IEFnYXJ3YWwgd3JvdGU6Cj4gPiBAQCAtNDM3LDExICs0MzMsMTIgQEAgc3RhdGljIGludCBnYmNv
ZGVjX21peGVyX2RhcG1fY3RsX3B1dChzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwKPiA+
ICAJc3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZTsKPiA+ICAJc3RydWN0IHNuZF9z
b2NfZGFwbV93aWRnZXRfbGlzdCAqd2xpc3QgPSBzbmRfa2NvbnRyb2xfY2hpcChrY29udHJvbCk7
Cj4gPiAgCXN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0ICp3aWRnZXQgPSB3bGlzdC0+d2lkZ2V0
c1swXTsKPiA+IC0Jc3RydWN0IHNuZF9zb2NfY29kZWMgKmNvZGVjID0gd2lkZ2V0LT5jb2RlYzsK
PiA+IC0Jc3RydWN0IGdiYXVkaW9fY29kZWNfaW5mbyAqZ2IgPSBzbmRfc29jX2NvZGVjX2dldF9k
cnZkYXRhKGNvZGVjKTsKPiA+ICsJc3RydWN0IGRldmljZSAqY29kZWNfZGV2ID0gd2lkZ2V0LT5k
YXBtLT5kZXY7Cj4gPiArCXN0cnVjdCBnYmF1ZGlvX2NvZGVjX2luZm8gKmdiID0gZGV2X2dldF9k
cnZkYXRhKGNvZGVjX2Rldik7Cj4gPiArCXN0cnVjdCBzbmRfc29jX2RhcG1fdXBkYXRlICp1cGRh
dGUgPSBOVUxMOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5e
Xl5eXl4KPiAKPiA+ICAJc3RydWN0IGdiX2J1bmRsZSAqYnVuZGxlOwo+ID4gIAo+ID4gLQlkZXZf
ZGJnKGNvZGVjLT5kZXYsICJFbnRlcmVkICVzOiVzXG4iLCBfX2Z1bmNfXywga2NvbnRyb2wtPmlk
Lm5hbWUpOwo+ID4gKwlkZXZfZGJnKGNvZGVjX2RldiwgIkVudGVyZWQgJXM6JXNcbiIsIF9fZnVu
Y19fLCBrY29udHJvbC0+aWQubmFtZSk7Cj4gPiAgCW1vZHVsZSA9IGZpbmRfZ2JfbW9kdWxlKGdi
LCBrY29udHJvbC0+aWQubmFtZSk7Cj4gPiAgCWlmICghbW9kdWxlKQo+ID4gIAkJcmV0dXJuIC1F
SU5WQUw7Cj4gPiBAQCAtNDU4LDE3ICs0NTUsMTMgQEAgc3RhdGljIGludCBnYmNvZGVjX21peGVy
X2RhcG1fY3RsX3B1dChzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwKPiA+ICAJbWF4ID0g
bGUzMl90b19jcHUoaW5mby0+dmFsdWUuaW50ZWdlci5tYXgpOwo+ID4gIAltYXNrID0gKDEgPDwg
ZmxzKG1heCkpIC0gMTsKPiA+ICAJdmFsID0gdWNvbnRyb2wtPnZhbHVlLmludGVnZXIudmFsdWVb
MF0gJiBtYXNrOwo+ID4gLQljb25uZWN0ID0gISF2YWw7Cj4gPiAgCj4gPiAgCS8qIHVwZGF0ZSB1
Y29udHJvbCAqLwo+ID4gIAlpZiAoZ2J2YWx1ZS52YWx1ZS5pbnRlZ2VyX3ZhbHVlWzBdICE9IHZh
bCkgewo+ID4gIAkJZm9yICh3aSA9IDA7IHdpIDwgd2xpc3QtPm51bV93aWRnZXRzOyB3aSsrKSB7
Cj4gPiAgCQkJd2lkZ2V0ID0gd2xpc3QtPndpZGdldHNbd2ldOwo+ID4gLQo+ID4gLQkJCXdpZGdl
dC0+dmFsdWUgPSB2YWw7Cj4gPiAtCQkJd2lkZ2V0LT5kYXBtLT51cGRhdGUgPSBOVUxMOwo+ID4g
LQkJCXNuZF9zb2NfZGFwbV9taXhlcl91cGRhdGVfcG93ZXIod2lkZ2V0LCBrY29udHJvbCwKPiA+
IC0JCQkJCQkJY29ubmVjdCk7Cj4gPiArCQkJc25kX3NvY19kYXBtX21peGVyX3VwZGF0ZV9wb3dl
cih3aWRnZXQtPmRhcG0sIGtjb250cm9sLAo+ID4gKwkJCQkJCQl2YWwsIHVwZGF0ZSk7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5eXl5eXgo+IEFsd2F5cyBOVUxMLiAgSnVzdCBkZWxldGUgdGhlIHVwZGF0ZSB2YXJpYWJsZS4K
CkFhaCwgbXkgYmFkISBUaGFua3MgRGFuIGZvciBzaGFyaW5nIHlvdXIgY29tbWVudHMuIEknbGwg
Zml4IHRoaXMgd2hpbGUgCnNoYXJpbmcgbmV4dCBwYXRjaHNldC4KCi0tClJlZ2FyZHMsClZhaWJo
YXYKCj4gCj4gcmVnYXJkcywKPiBkYW4gY2FycGVudGVyCj4gCj4gCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApn
cmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
