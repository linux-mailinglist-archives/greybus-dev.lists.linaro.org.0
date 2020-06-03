Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6C11ED529
	for <lists+greybus-dev@lfdr.de>; Wed,  3 Jun 2020 19:42:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D50DD6179A
	for <lists+greybus-dev@lfdr.de>; Wed,  3 Jun 2020 17:42:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C84BB618D2; Wed,  3 Jun 2020 17:42:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,FSL_HELO_FAKE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0D7FD618C3;
	Wed,  3 Jun 2020 17:42:39 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 62D2E6173E
 for <greybus-dev@lists.linaro.org>; Wed,  3 Jun 2020 17:42:36 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 552ED6187F; Wed,  3 Jun 2020 17:42:36 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by lists.linaro.org (Postfix) with ESMTPS id 602106173E
 for <greybus-dev@lists.linaro.org>; Wed,  3 Jun 2020 17:42:35 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b16so2050151pfi.13
 for <greybus-dev@lists.linaro.org>; Wed, 03 Jun 2020 10:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=11EqLqigawu5AuEW1gFIrsexclHL8DCzdN7DBjvUYqA=;
 b=ABvg/T/aLc1Cyz+JTVlCgFEEEM+rvEm+EfeaxYYhDL0qSeweQvvuwftmyJYsfHGpL3
 UslBxHxPJakFUNb6kExBnPGk7oYeHkw3E4f8Esj8mBSHu9v8jQNLCjloyRWRUdNCjkxk
 eCz9kjj/FgFT0DBqE3R1xPUX84bkj6MU7bIkqgnVdNGEzRYEgwj4fN84jI2H6MKmefCN
 hwPdEi2Towq4D+xNiJpeDIf1Pez48F723nc2OgH5ZFSAJLUNVvc2CqmMLY0mPXkJW6JK
 ZNrDtK91LkeImVvbfS5a4I/xxYtdWmAhYyFlbJRQfSI7Xq8IzE6+Av7R7T1LP0vBodF6
 uEfg==
X-Gm-Message-State: AOAM531u9rSBS10EFUgKzGTXv5qujKLADYDxt1HZNoYH9RWI0lMz0+lu
 IoThRxZzIRJGaRXSKUWjzSI=
X-Google-Smtp-Source: ABdhPJzyIQBGa1ntOKSqo1SvAnBFrCrm6S7cNpV+bs4hx8uQCJMs5mKCao88L4qsI/tdDw36VJZWCA==
X-Received: by 2002:aa7:9431:: with SMTP id y17mr238635pfo.33.1591206154354;
 Wed, 03 Jun 2020 10:42:34 -0700 (PDT)
Received: from gmail.com ([192.55.55.41])
 by smtp.gmail.com with ESMTPSA id nl8sm3772210pjb.13.2020.06.03.10.42.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jun 2020 10:42:33 -0700 (PDT)
Date: Wed, 3 Jun 2020 23:12:25 +0530
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200603174222.GB21465@gmail.com>
References: <cover.1591040859.git.vaibhav.sr@gmail.com>
 <77cfc355b87ee21636430f787764700de1983f38.1591040859.git.vaibhav.sr@gmail.com>
 <20200602125715.GI30374@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200602125715.GI30374@kadam>
User-Agent: Mutt/1.10.1+3 (f9293d646485) (2018-09-22)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, greybus-dev@lists.linaro.org,
 Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [RESEND PATCH v1 6/6] staging: greybus: audio:
 Enable GB codec, audio module compilation.
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

T24gVHVlLCBKdW4gMDIsIDIwMjAgYXQgMDM6NTc6MTVQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBPbiBUdWUsIEp1biAwMiwgMjAyMCBhdCAxMDo1MToxNUFNICswNTMwLCBWYWliaGF2
IEFnYXJ3YWwgd3JvdGU6Cj4gPiBDdXJyZW50bHksIEdCIGNvZGVjIGFuZCBhdWRpbyBtb2R1bGUg
aXMgY29uZGl0aW9uYWxseSBjb21waWxlZCBiYXNlZCBvbgo+ID4gR1JFWUJVU19BVURJT19NU004
OTk0LiBIb3dldmVyLCBhdWRpbyBtb2R1bGUgaXMgbm90IGRlcGVuZGVudCBvbiBNU004OTk0Cj4g
PiBwbGF0Zm9ybSBhbmQgY2FuIGJlIHVzZWQgZ2VuZXJpY2FsbHkgd2l0aCBhbnkgcGxhdGZvcm0g
dGhhdCBmb2xsb3dzCj4gPiBHQiBBdWRpbyBjbGFzcyBzcGVjaWZpY2F0aW9uLgo+ID4gCj4gPiBB
bHNvLCBHQiBjb2RlYyBkcml2ZXIgY29ycmVzcG9uZHMgdG8gZHVtbXkgY29kZWMgcmVwcmVzZW50
ZWQgYnkgSTJTIHBvcnQKPiA+IGF2YWlsYWJsZSBvbiBUb3NoaWJhIEFQIEJyaWRnZS4gQWRkZWQg
Y29uZmlnIG9wdGlvbiBmb3IgdGhlIHNhbWUgaW4KPiA+IGtjb25maWcgZmlsZSBhbmQgYWNjb3Jk
aW5nbHkgdXBkYXRlZCBNYWtlZmlsZS4KPiA+IAo+IAo+IFRoaXMgY29tbWl0IG1lc3NhZ2Ugd2Fz
IGEgYml0IGNvbmZ1c2luZyB0byBtZS4gIEp1c3Qgc2F5Ogo+IAo+ICJDdXJyZW50bHkgeW91IGNh
bid0IGVuYWJsZSB0aGUgR3JleSBCdXMgQXVkaW8gQ29kZWMgYmVjYXVzZSB0aGVyZSBpcyBubwo+
IGVudHJ5IGZvciBpdCBpbiB0aGUgS2NvbmZpZyBmaWxlLiAgT3JpZ2luYWxseSB0aGUgY29uZmln
IG5hbWUgd2FzIGdvaW5nCj4gdG8gYmUgQVVESU9fTVNNODk5NCBidXQgdGhhdCdzIG5vdCBjb3Jy
ZWN0IGJlY2F1c2Ugb3RoZXIgdHlwZXMgb2YKPiBoYXJkd2FyZSBhcmUgc3VwcG9ydGVkIG5vdy4g
IEkgaGF2ZSBjaG9zZW4gdGhlIG5hbWUgQVVESU9fQVBCX0NPREVDCj4gaW5zdGVhZC4gIEFsc28g
SSBoYWQgdG8gdXBkYXRlIHRoZSBkZXBlbmRlbmNpZXMgZm9yIEdSRVlCVVNfQVVESU8gdG8KPiBt
YWtlIHRoZSBjb21waWxlIHdvcmsuIgo+IAo+IE90aGVyd2lzZSB0aGlzIGxvb2tzIGZpbmUuCgpU
aGFua3MgRGFuIGZvciBzaGFyaW5nIHlvdXIgdmFsdWFibGUgZmVlZGJhY2suIEknbGwgbWFrZSB0
aGUgc3VnZ2VzdGVkIApjaGFuZ2VzIGZvciB0aGUgY29tcGxldGUgc2VyaWVzIGluIHYyIHBhdGNo
c2V0LgoKcmVnYXJkcywKdmFpYmhhdgoKPiAKPiByZWdhcmRzLAo+IGRhbiBjYXJwZW50ZXIKPiAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
