Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD8C1833E9
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2020 15:58:21 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9295E616FC
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2020 14:58:20 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 8429A617EF; Thu, 12 Mar 2020 14:58:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 84D2B61791;
	Thu, 12 Mar 2020 14:58:09 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8D6A160E9E
 for <greybus-dev@lists.linaro.org>; Thu, 12 Mar 2020 14:58:07 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 72C79616FC; Thu, 12 Mar 2020 14:58:07 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by lists.linaro.org (Postfix) with ESMTPS id 6A92960E9E
 for <greybus-dev@lists.linaro.org>; Thu, 12 Mar 2020 14:58:06 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id c20so5126704lfb.0
 for <greybus-dev@lists.linaro.org>; Thu, 12 Mar 2020 07:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MdykorgHJ2m1Uy++8it61ejlAV2pQD4rRbpkRh1crhg=;
 b=IJ/+LQCK0FA07GyHVV5VdDIgmnK9bUCuDej5qMoWxOF+4BLkS29+BAAPRO00gcR8Yb
 vkFYutXTp+B5VXiz4U70NNP/aYe7S38kbxTGtH1LplW0DKhCuiQerygLh/F1058Jdef+
 VE19uTpJeB3DNTlcr56Bg+EDusDXZgSyZbF7VhdJHytwsHIm9X6LKUlv831P9QdJmHbp
 tal0VsVITTFO6271h/qp0IvMGvWLAQS6xJVjNLOj6dI8BSZIM6kmQEdcBMs3CFhM19H/
 yvGQ33RL07zabHsFfQ2DZ56bq46xlIl4oAEO5MTt4NV5eilYm9iB1yIk4dbiRt1TaBOf
 Am0g==
X-Gm-Message-State: ANhLgQ1f0bDA9na9joJ5s2jwBN2qtQGlDhrbFWHDU89m/9Bwg04nxcTB
 +o+L2NlgBTZseGfib9tM22o=
X-Google-Smtp-Source: ADFU+vv44HF48yUbUtrQ6zG8TaNfTSOFBGd0BXJrP42WUadY2hV8NAqUZ171tik/AK9rVOjZWZ3Atg==
X-Received: by 2002:a19:4354:: with SMTP id m20mr1522861lfj.166.1584025085350; 
 Thu, 12 Mar 2020 07:58:05 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.170.18])
 by smtp.gmail.com with ESMTPSA id j82sm15371068lfj.14.2020.03.12.07.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 07:58:04 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1jCPHV-00027Q-N7; Thu, 12 Mar 2020 15:57:53 +0100
Date: Thu, 12 Mar 2020 15:57:53 +0100
From: Johan Hovold <johan@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200312145753.GS14211@localhost>
References: <20200311091906.22980-1-tiwai@suse.de>
 <20200311095814.GI14211@localhost> <20200312145111.GO11561@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312145111.GO11561@kadam>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Takashi Iwai <tiwai@suse.de>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org
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

T24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMDU6NTE6MTFQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBPbiBXZWQsIE1hciAxMSwgMjAyMCBhdCAxMDo1ODoxNEFNICswMTAwLCBKb2hhbiBI
b3ZvbGQgd3JvdGU6Cj4gPiBPbiBXZWQsIE1hciAxMSwgMjAyMCBhdCAxMDoxOTowNkFNICswMTAw
LCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4gPiA+IFNpbmNlIHNucHJpbnRmKCkgcmV0dXJucyB0aGUg
d291bGQtYmUtb3V0cHV0IHNpemUgaW5zdGVhZCBvZiB0aGUKPiA+ID4gYWN0dWFsIG91dHB1dCBz
aXplLCB0aGUgc3VjY2VlZGluZyBjYWxscyBtYXkgZ28gYmV5b25kIHRoZSBnaXZlbgo+ID4gPiBi
dWZmZXIgbGltaXQuICBGaXggaXQgYnkgcmVwbGFjaW5nIHdpdGggc2NucHJpbnRmKCkuCj4gPiA+
IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+Cj4gPiA+
IC0tLQo+ID4gPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVzdC5j
IHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gPiAKPiA+IFRoYW5rcyBmb3IgdGhlIGZp
eC4KPiA+IAo+ID4gV291bGQgeW91IG1pbmQgcmVzZW5kaW5nIHdpdGggYSAic3RhZ2luZzogZ3Jl
eWJ1czogbG9vcGJhY2tfdGVzdDoiCj4gPiBwcmVmaXggc2luY2UgdGhpcyBpcyBub3QgYSBzdWJz
eXN0ZW0gd2lkZSBpc3N1ZSwgYnVyIHJhdGhlciBhIGJ1ZyBpbiBhCj4gPiBzcGVjaWZpYyB1c2Vy
LXNwYWNlIHRvb2w/Cj4gCj4gSSdtIHN1cnByaXNlZCB0aGF0IHVzZXItc3BhY2UgZXZlbiBoYXMg
c2NucHJpbnRmKCkuCgpZZWFoLCBzZWUgdGhlIHJlc3Qgb2YgdGhlIHRocmVhZC4KCkpvaGFuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2
IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMu
bGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
