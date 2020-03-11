Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F131181587
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2020 11:10:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4123F65FCC
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2020 10:10:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3352F65FCD; Wed, 11 Mar 2020 10:10:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5A64365FB9;
	Wed, 11 Mar 2020 10:10:16 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3E33E6184D
 for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2020 10:10:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 316BB619B5; Wed, 11 Mar 2020 10:10:14 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by lists.linaro.org (Postfix) with ESMTPS id 2E8EE6184D
 for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2020 10:10:13 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id j17so1172178lfe.7
 for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2020 03:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1XLEeIPfqgBDQQvgNuhJItuY/OoKKpQLje79EweWqFE=;
 b=Jk0D1ZNInMGCG7CE6u+MrdKjJW5yLc2iKzFDXEmB58aEluoioiQxv61jeOl/17jZbD
 3MDl6s7x51Fwlvnghj0fRaFf9qLL8WCmPeiYbX0kpGt1YyRPAZkpgI8XDnyrIriTm4zI
 rwYUjNvImy5NYUguIJBjrEy0VpAEraz8vM+qXB9y+3kk3RlkqH5Zc0cHKK/cIhf+Gk6Z
 +pYRJ/XWh8YrzrEfVYSBay/lXmEa+jW9qhr/s4TxSzDZwBSsVbL7jLiZKPxHyssn62Pq
 PIpOze1g6x2yVRBQA9UDAlDCA/e1K/UExskOjD78rOKzM1kHlqI5BH2l2AaORHJGWUXN
 7s8g==
X-Gm-Message-State: ANhLgQ2VCIWZQytU7HEM9+Bff0HU1ws9h9BL4IcJxD7NetRZqDTkC1VL
 0wyb8RxrkNia98yG8BYL9Ab7LLoS
X-Google-Smtp-Source: ADFU+vsnhCrAPpusQtABX5HWr+F/qSRtGWNDECFv8RkNxZp8EvewOxXKz8zUSHAbyUJPPUWabZreTQ==
X-Received: by 2002:ac2:46ec:: with SMTP id q12mr1694023lfo.60.1583921412100; 
 Wed, 11 Mar 2020 03:10:12 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.170.18])
 by smtp.gmail.com with ESMTPSA id b16sm3341426lfg.33.2020.03.11.03.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 03:10:11 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1jByJL-0004gt-9S; Wed, 11 Mar 2020 11:09:59 +0100
Date: Wed, 11 Mar 2020 11:09:59 +0100
From: Johan Hovold <johan@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20200311100959.GK14211@localhost>
References: <20200311100535.29635-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311100535.29635-1-tiwai@suse.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH RESEND] staging: greybus: loopback_test:
 Use scnprintf() for avoiding potential buffer overflow
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

T24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMTE6MDU6MzVBTSArMDEwMCwgVGFrYXNoaSBJd2FpIHdy
b3RlOgo+IFNpbmNlIHNucHJpbnRmKCkgcmV0dXJucyB0aGUgd291bGQtYmUtb3V0cHV0IHNpemUg
aW5zdGVhZCBvZiB0aGUKPiBhY3R1YWwgb3V0cHV0IHNpemUsIHRoZSBzdWNjZWVkaW5nIGNhbGxz
IG1heSBnbyBiZXlvbmQgdGhlIGdpdmVuCj4gYnVmZmVyIGxpbWl0LiAgRml4IGl0IGJ5IHJlcGxh
Y2luZyB3aXRoIHNjbnByaW50ZigpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRha2FzaGkgSXdhaSA8
dGl3YWlAc3VzZS5kZT4KPiAtLS0KPiAKPiBKdXN0IGNvcnJlY3RlZCB0aGUgc3ViamVjdCBwcmVm
aXggcGVyIHJlcXVlc3QuCgpBY2tlZC1ieTogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3Jn
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVz
LWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xp
c3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
