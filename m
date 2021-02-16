Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C136531CD25
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 16:48:20 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D128466067
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 15:48:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C4A5F6186A; Tue, 16 Feb 2021 15:48:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F096C61887;
	Tue, 16 Feb 2021 15:48:09 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 9C1A160FF9
 for <greybus-dev@lists.linaro.org>; Tue, 16 Feb 2021 15:48:07 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8C6E460C36; Tue, 16 Feb 2021 15:48:07 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by lists.linaro.org (Postfix) with ESMTPS id AA56360C36
 for <greybus-dev@lists.linaro.org>; Tue, 16 Feb 2021 15:48:06 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id z68so6489228pgz.0
 for <greybus-dev@lists.linaro.org>; Tue, 16 Feb 2021 07:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yKpUz4pp/u/PHJPYKcG1YaVfe5CKl2imPNvR4JyBFYE=;
 b=qc4N8PVEj+3J+ix8dSKStLSwQ6yBnXHW159eT/HD6pdyQVdbHP5QNJFS6ie77XgKz1
 iMAqr/C5OuDeafu+Kh83BtNB9ciAlB4AgruRYTjnFqGDXpPlYxNg/9mQNYWFzQHwdlSZ
 yQjwJ9elwej2LY59XdS1ftyHv/97XZbN/7O6k00gqd27SnfCxx7lIuxFjpMZGzByV9Hs
 w8s0IrSS+XUNru/ldCMebvssbHFj0DdmV7cGrrIwEYvYCJd1T9SNLtbkCwNd/tLsiyj0
 WHco6VguyiflSp+F8u3VdycQQCMLyCyQS/RGPjDiAOtMk9Qr8BGCH2Yft0olE2RgK0xU
 oYwQ==
X-Gm-Message-State: AOAM533vg2JqYvhrOqXfjBtS7f2cX3HiD9duTEtoqh/B50iFgt+GVzHu
 dz9n2LhkxRt9bJEhry9UBSI=
X-Google-Smtp-Source: ABdhPJwaooUaIKDd1k8p39TS9r9FEuHlOTnCnoBBnatGbzSGokeWf0RqRcRmZatTM6RlcbYYacdx4w==
X-Received: by 2002:a63:c1d:: with SMTP id b29mr19918863pgl.9.1613490485842;
 Tue, 16 Feb 2021 07:48:05 -0800 (PST)
Received: from localhost ([2402:3a80:11ea:c83a:a2a4:c5ff:fe20:7222])
 by smtp.gmail.com with ESMTPSA id n142sm22804138pfd.82.2021.02.16.07.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 07:48:05 -0800 (PST)
Date: Tue, 16 Feb 2021 21:18:00 +0530
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: Alex Elder <elder@ieee.org>
Message-ID: <20210216154800.jg24ahfj52t6qgbd@apollo>
References: <20210131172838.146706-1-memxor@gmail.com>
 <20210131172838.146706-3-memxor@gmail.com>
 <b565bdae-10a9-9b6c-ae60-dcee88f7dedd@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b565bdae-10a9-9b6c-ae60-dcee88f7dedd@ieee.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linux-fbdev@vger.kernel.org, Jon Nettleton <jon.nettleton@gmail.com>,
 Marc Dietrich <marvin24@gmx.de>, Ioana Ciornei <ioana.ciornei@nxp.com>,
 Thomas Gleixner <tglx@linutronix.de>, ac100@lists.launchpad.net,
 devel@driverdev.osuosl.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Florian Fainelli <f.fainelli@gmail.com>, Daniel Drake <dsd@laptop.org>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>,
 Jens Frederich <jfrederich@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Robert Richter <rric@kernel.org>, Johan Hovold <johan@kernel.org>,
 Ian Abbott <abbotti@mev.co.uk>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-tegra@vger.kernel.org, William Cohen <wcohen@redhat.com>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Alex Elder <elder@kernel.org>, Teddy Wang <teddy.wang@siliconmotion.com>,
 greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [greybus-dev] [PATCH 02/13] staging: greybus: Switch from
	strlcpy to strscpy
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

T24gVHVlLCBGZWIgMTYsIDIwMjEgYXQgMDg6MjQ6NTlQTSBJU1QsIEFsZXggRWxkZXIgd3JvdGU6
Cj4gVGhpcyBpcyBhIGdvb2QgY2hhbmdlLiAgQnV0IHdoaWxlIHlvdSdyZSBhdCBpdCwgSSB3b3Vs
ZAo+IGFwcHJlY2lhdGUgaWYgeW91IHdvdWxkIGNvbnZlcnQgYSBmZXcgc3BvdHMgdG8gdXNlCj4g
c2l6ZW9mKGRlc3QpIHJhdGhlciB0aGFuIGEgZml4ZWQgY29uc3RhbnQuICBJIHdpbGwKPiBwb2lu
dCB0aGVtIG91dCBiZWxvdy4KPiAKPiBJZiB0aGlzIGlzIHRoZSAqb25seSogcmVxdWVzdCBmb3Ig
YSBjaGFuZ2Ugb24geW91cgo+IHNlcmllcywgcGxlYXNlIHRlbGwgbWUgdGhhdCBhbmQgSSBjYW4g
c2lnbiBvZmYgb24KClNvIGZhciwgdGhpcyBoYXMgYmVlbiB0aGUgb25seSByZXF1ZXN0LgoKPiB0
aGlzIHdpdGhvdXQgeW91IGltcGxlbWVudGluZyBteSBzdWdnZXN0aW9uLiAgQnV0Cj4gaWYgeW91
IHBvc3QgYSB2ZXJzaW9uIDIsIHBsZWFzZSBkbyB3aGF0IEkgZGVzY3JpYmUuCj4gCgpJIHdpbGwg
aW5jb3Jwb3JhdGUgdGhlc2UgaWYgSSBlbmQgdXAgc2VuZGluZyBhIHYyLgoKQWx0ZXJuYXRpdmVs
eSwgd291bGQgYSBzZXBhcmF0ZSBwYXRjaCB3aXRoIHlvdXIgc3VnZ2VzdGlvbnMgYXBwbGllZCBv
biB0b3Agb2YKdGhpcyBiZSBhY2NlcHRhYmxlLCBpZiBJIGRvbid0PwoKLS0gCkthcnRpa2V5YQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRl
diBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3Rz
LmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
