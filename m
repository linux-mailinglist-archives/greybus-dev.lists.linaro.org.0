Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E85181563
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2020 10:58:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4208C619B5
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2020 09:58:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 28B4F65FCC; Wed, 11 Mar 2020 09:58:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 777B565FB9;
	Wed, 11 Mar 2020 09:58:31 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 0CD0E6194F
 for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2020 09:58:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E9DF4619B5; Wed, 11 Mar 2020 09:58:29 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by lists.linaro.org (Postfix) with ESMTPS id D11086194F
 for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2020 09:58:28 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id u12so1617659ljo.2
 for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2020 02:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VAI2bOsO0HpRfJqCHKKcijyQkz20rw0OzgA5Crqoiz4=;
 b=q6luColSRhx58UBE5YJCeW9uU+FLB3vt9AT3xa3flFNEmCdftZ/3XXbEEFmPr+QSmF
 EAWnSuVrO6OxGpqXH2MtJ/69g7ge73iyCu0hsRyLQ7fpMM3vvQ26rVbARS3sJEspyxfe
 u5P3KklUDGXMES46Vl1FC6pAWQlhP2eRytcqN/yQyMp9p24HxXaVpbFy0XzrdV8snlEB
 xWQPrN4ZwqJlPSnJfkQiE51Keuf3GY7YIuHYSY97H3frDgZN/o1ECe1l8hNP3d9p8dPn
 IUJ1MyUSaK7Lh3Vg6EaHWkIB9PyQey15pFtW3gGPZt8tdDWZUD1u8XhoZv5A1T7lxUKH
 FqLA==
X-Gm-Message-State: ANhLgQ0Xq9/exn729dxiii13QWKyjLUDqNUhSRS6LCbmepwKmzo5ctHQ
 X3lvUCNGyqxJq/Y++z8QtZ0=
X-Google-Smtp-Source: ADFU+vvS/3XWjiuTpD521o/YzZvXK+sFaQu0rsj54RL+2S9qftvdNg171Q67d/3brpXif2QhmyanQg==
X-Received: by 2002:a05:651c:1044:: with SMTP id
 x4mr520801ljm.230.1583920707833; 
 Wed, 11 Mar 2020 02:58:27 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.170.18])
 by smtp.gmail.com with ESMTPSA id f16sm3094218ljj.34.2020.03.11.02.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 02:58:27 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1jBy7y-0004c2-V6; Wed, 11 Mar 2020 10:58:15 +0100
Date: Wed, 11 Mar 2020 10:58:14 +0100
From: Johan Hovold <johan@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20200311095814.GI14211@localhost>
References: <20200311091906.22980-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311091906.22980-1-tiwai@suse.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Use scnprintf() for
 avoiding potential buffer overflow
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

T24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMTA6MTk6MDZBTSArMDEwMCwgVGFrYXNoaSBJd2FpIHdy
b3RlOgo+IFNpbmNlIHNucHJpbnRmKCkgcmV0dXJucyB0aGUgd291bGQtYmUtb3V0cHV0IHNpemUg
aW5zdGVhZCBvZiB0aGUKPiBhY3R1YWwgb3V0cHV0IHNpemUsIHRoZSBzdWNjZWVkaW5nIGNhbGxz
IG1heSBnbyBiZXlvbmQgdGhlIGdpdmVuCj4gYnVmZmVyIGxpbWl0LiAgRml4IGl0IGJ5IHJlcGxh
Y2luZyB3aXRoIHNjbnByaW50ZigpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRha2FzaGkgSXdhaSA8
dGl3YWlAc3VzZS5kZT4KPiAtLS0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdG9vbHMvbG9v
cGJhY2tfdGVzdC5jIHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0tCgpUaGFua3MgZm9yIHRo
ZSBmaXguCgpXb3VsZCB5b3UgbWluZCByZXNlbmRpbmcgd2l0aCBhICJzdGFnaW5nOiBncmV5YnVz
OiBsb29wYmFja190ZXN0OiIKcHJlZml4IHNpbmNlIHRoaXMgaXMgbm90IGEgc3Vic3lzdGVtIHdp
ZGUgaXNzdWUsIGJ1ciByYXRoZXIgYSBidWcgaW4gYQpzcGVjaWZpYyB1c2VyLXNwYWNlIHRvb2w/
CgpKb2hhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRw
czovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
