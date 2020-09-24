Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B712771BA
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Sep 2020 15:01:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 11CEA66547
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Sep 2020 13:01:31 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id F2BED6654B; Thu, 24 Sep 2020 13:01:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A3F7C66529;
	Thu, 24 Sep 2020 13:01:16 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id CE40966521
 for <greybus-dev@lists.linaro.org>; Thu, 24 Sep 2020 13:01:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id ADCE066528; Thu, 24 Sep 2020 13:01:13 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by lists.linaro.org (Postfix) with ESMTPS id 0C69D66521
 for <greybus-dev@lists.linaro.org>; Thu, 24 Sep 2020 13:01:12 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id q5so3054768ilj.1
 for <greybus-dev@lists.linaro.org>; Thu, 24 Sep 2020 06:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zPB7jULHIg1msvTaEkWc/XGqvJfOwCy594X3DY/QjvE=;
 b=B2nnORkuRoSqwU4TUemM5L9TtZOjgs/ALMISbRFnua2o9KuyPlhYExuLKMCctjM9kG
 ATvQsX1tjsIe74FPAdrlDwvB79o7HFcX66bxtj/BeRbcFUhMKgCoQJYEkITxKFm6R5Go
 +S+cU89MRH7j3inLp99L0pxcdths/1cryouee0D4yWWAkcrUZE6rsSH541/28fhOdHNy
 t5Znx57wQiRHzgkrNJzKSIjbObam3d6dIux+yayBQBp28PgQhXka3soNQd2RN2Fnoded
 U6tWf9tTM207L6dPppiSNbPtZwOZh4PYPyp7gMmmLCFROBuJU0wm9IKRrOt7lbZ2KAxd
 IJKQ==
X-Gm-Message-State: AOAM532MWVl5XlBK46TOc2/oFRZQQ2nE1rhEngcJj9jpbe+8KZQcaMbE
 zEKMoP2a8/F4uPHFtq28I5tsKMWp
X-Google-Smtp-Source: ABdhPJwKytinnF4jKyr8BsEenwtoJNaAp3EfRWwKAmJYb8V3sOg5GraVPWm16zthU56b8nazxGYZsQ==
X-Received: by 2002:a92:9e0f:: with SMTP id q15mr4093943ili.286.1600952471522; 
 Thu, 24 Sep 2020 06:01:11 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id q5sm1613477ile.63.2020.09.24.06.01.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 06:01:10 -0700 (PDT)
To: Coiby Xu <coiby.xu@gmail.com>, devel@driverdev.osuosl.org
References: <20200924102039.43895-1-coiby.xu@gmail.com>
 <20200924102039.43895-3-coiby.xu@gmail.com>
From: Alex Elder <elder@linaro.org>
Message-ID: <772d78de-630f-4b0f-16cc-4e67b8f98907@linaro.org>
Date: Thu, 24 Sep 2020 08:01:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924102039.43895-3-coiby.xu@gmail.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Alex Elder <elder@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 Johan Hovold <johan@kernel.org>
Subject: Re: [greybus-dev] [PATCH 3/3] [PATCH] staging: greybus: __u8 is
 sufficient for snd_ctl_elem_type_t and snd_ctl_elem_iface_t
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

T24gOS8yNC8yMCA1OjIwIEFNLCBDb2lieSBYdSB3cm90ZToKPiBVc2UgX184IHRvIHJlcGxhY2Ug
aW50IGFuZCByZW1vdmUgdGhlIHVubmVjZXNzYXJ5IF9fYml0d2lzZSB0eXBlIGF0dHJpYnV0ZS4K
PiAKPiBGb3VuZCBieSBzcGFyc2UsCgpHcmVnJ3MgcmlnaHQsIGRvbid0IGNoYW5nZSB0aGUgcHVi
bGljIGhlYWRlci4KCllvdSBjb3VsZCB0cnkgdGhpcyBpbiB0aGUgR3JleWJ1cyBjb2RlIHRvIGVs
aW1pbmF0ZSB0aGUgd2FybmluZywKYnV0IEkgaGF2ZW4ndCB0cmllZCBpdCAoYW5kIGZvciBhbGwg
SSBrbm93IGl0J3Mgbm90IGEgZ29vZCBpZGVhKToKCgl1aW5mby0+dHlwZSA9IChfX2ZvcmNlIHNu
ZF9jdGxfZWxlbV90eXBlX3QpaW5mby0+dHlwZTsKCgkJCQkJLUFsZXgKCj4gJCBtYWtlIEM9MiBk
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy8KPiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190
b3BvbG9neS5jOjE4NToyNDogd2FybmluZzogY2FzdCB0byByZXN0cmljdGVkIHNuZF9jdGxfZWxl
bV90eXBlX3QKPiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jOjY3OTox
NDogd2FybmluZzogcmVzdHJpY3RlZCBzbmRfY3RsX2VsZW1faWZhY2VfdCBkZWdyYWRlcyB0byBp
bnRlZ2VyCj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYzo5MDY6MTQ6
IHdhcm5pbmc6IHJlc3RyaWN0ZWQgc25kX2N0bF9lbGVtX2lmYWNlX3QgZGVncmFkZXMgdG8gaW50
ZWdlcgo+IAo+IFNpZ25lZC1vZmYtYnk6IENvaWJ5IFh1IDxjb2lieS54dUBnbWFpbC5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMgfCAyICstCj4g
IGluY2x1ZGUvdWFwaS9zb3VuZC9hc291bmQuaCAgICAgICAgICAgICAgfCA0ICsrLS0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMgYi9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jCj4gaW5kZXggNTZiZjFhNGY5NWFkLi5m
NjAyM2ZmMzkwYzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9f
dG9wb2xvZ3kuYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5
LmMKPiBAQCAtMTgyLDcgKzE4Miw3IEBAIHN0YXRpYyBpbnQgZ2Jjb2RlY19taXhlcl9jdGxfaW5m
byhzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwKPiAgCS8qIHVwZGF0ZSB1aW5mbyAqLwo+
ICAJdWluZm8tPmFjY2VzcyA9IGRhdGEtPmFjY2VzczsKPiAgCXVpbmZvLT5jb3VudCA9IGRhdGEt
PnZjb3VudDsKPiAtCXVpbmZvLT50eXBlID0gKHNuZF9jdGxfZWxlbV90eXBlX3QpaW5mby0+dHlw
ZTsKPiArCXVpbmZvLT50eXBlID0gaW5mby0+dHlwZTsKPiAgCj4gIAlzd2l0Y2ggKGluZm8tPnR5
cGUpIHsKPiAgCWNhc2UgR0JfQVVESU9fQ1RMX0VMRU1fVFlQRV9CT09MRUFOOgo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL3VhcGkvc291bmQvYXNvdW5kLmggYi9pbmNsdWRlL3VhcGkvc291bmQvYXNv
dW5kLmgKPiBpbmRleCA1MzVhNzIyOWUxZDkuLjhlNzFhOTU2NDRhYiAxMDA2NDQKPiAtLS0gYS9p
bmNsdWRlL3VhcGkvc291bmQvYXNvdW5kLmgKPiArKysgYi9pbmNsdWRlL3VhcGkvc291bmQvYXNv
dW5kLmgKPiBAQCAtOTUwLDcgKzk1MCw3IEBAIHN0cnVjdCBzbmRfY3RsX2NhcmRfaW5mbyB7Cj4g
IAl1bnNpZ25lZCBjaGFyIGNvbXBvbmVudHNbMTI4XTsJLyogY2FyZCBjb21wb25lbnRzIC8gZmlu
ZSBpZGVudGlmaWNhdGlvbiwgZGVsaW1pdGVkIHdpdGggb25lIHNwYWNlIChBQzk3IGV0Yy4uKSAq
Lwo+ICB9Owo+ICAKPiAtdHlwZWRlZiBpbnQgX19iaXR3aXNlIHNuZF9jdGxfZWxlbV90eXBlX3Q7
Cj4gK3R5cGVkZWYgX191OCBzbmRfY3RsX2VsZW1fdHlwZV90Owo+ICAjZGVmaW5lCVNORFJWX0NU
TF9FTEVNX1RZUEVfTk9ORQkoKF9fZm9yY2Ugc25kX2N0bF9lbGVtX3R5cGVfdCkgMCkgLyogaW52
YWxpZCAqLwo+ICAjZGVmaW5lCVNORFJWX0NUTF9FTEVNX1RZUEVfQk9PTEVBTgkoKF9fZm9yY2Ug
c25kX2N0bF9lbGVtX3R5cGVfdCkgMSkgLyogYm9vbGVhbiB0eXBlICovCj4gICNkZWZpbmUJU05E
UlZfQ1RMX0VMRU1fVFlQRV9JTlRFR0VSCSgoX19mb3JjZSBzbmRfY3RsX2VsZW1fdHlwZV90KSAy
KSAvKiBpbnRlZ2VyIHR5cGUgKi8KPiBAQCAtOTYwLDcgKzk2MCw3IEBAIHR5cGVkZWYgaW50IF9f
Yml0d2lzZSBzbmRfY3RsX2VsZW1fdHlwZV90Owo+ICAjZGVmaW5lCVNORFJWX0NUTF9FTEVNX1RZ
UEVfSU5URUdFUjY0CSgoX19mb3JjZSBzbmRfY3RsX2VsZW1fdHlwZV90KSA2KSAvKiA2NC1iaXQg
aW50ZWdlciB0eXBlICovCj4gICNkZWZpbmUJU05EUlZfQ1RMX0VMRU1fVFlQRV9MQVNUCVNORFJW
X0NUTF9FTEVNX1RZUEVfSU5URUdFUjY0Cj4gIAo+IC10eXBlZGVmIGludCBfX2JpdHdpc2Ugc25k
X2N0bF9lbGVtX2lmYWNlX3Q7Cj4gK3R5cGVkZWYgX191OCBzbmRfY3RsX2VsZW1faWZhY2VfdDsK
PiAgI2RlZmluZQlTTkRSVl9DVExfRUxFTV9JRkFDRV9DQVJECSgoX19mb3JjZSBzbmRfY3RsX2Vs
ZW1faWZhY2VfdCkgMCkgLyogZ2xvYmFsIGNvbnRyb2wgKi8KPiAgI2RlZmluZQlTTkRSVl9DVExf
RUxFTV9JRkFDRV9IV0RFUAkoKF9fZm9yY2Ugc25kX2N0bF9lbGVtX2lmYWNlX3QpIDEpIC8qIGhh
cmR3YXJlIGRlcGVuZGVudCBkZXZpY2UgKi8KPiAgI2RlZmluZQlTTkRSVl9DVExfRUxFTV9JRkFD
RV9NSVhFUgkoKF9fZm9yY2Ugc25kX2N0bF9lbGVtX2lmYWNlX3QpIDIpIC8qIHZpcnR1YWwgbWl4
ZXIgZGV2aWNlICovCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJv
Lm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRl
dgo=
