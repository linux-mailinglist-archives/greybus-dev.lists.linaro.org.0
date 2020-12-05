Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DF52CFB95
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Dec 2020 15:47:46 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6F7A0608F6
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Dec 2020 14:47:45 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 61C936164A; Sat,  5 Dec 2020 14:47:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 542F06183D;
	Sat,  5 Dec 2020 14:47:34 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 15B1D608F6
 for <greybus-dev@lists.linaro.org>; Sat,  5 Dec 2020 14:47:32 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id EE0C6616DC; Sat,  5 Dec 2020 14:47:31 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by lists.linaro.org (Postfix) with ESMTPS id DA09E608F6
 for <greybus-dev@lists.linaro.org>; Sat,  5 Dec 2020 14:47:30 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id p6so4735134plr.7
 for <greybus-dev@lists.linaro.org>; Sat, 05 Dec 2020 06:47:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nXyfW/MOF1GC7gFH6eMrnSd2RczMd1PKQk2yaRcPi1g=;
 b=eI5abZ4wPWlbXAR5GkGEn7PmIyhHs2kN0/lKLVq2aSwtGC23Kzp6/qz6+OEIFDLfY8
 Zj+D9luvO2TtUX1UIxusHqqtRShKI4PEDs0tPhwQ3ECJhEa86kpskbFVir7kSaKz6WJZ
 khpSY2c+T9NlN5ZR8IUvY52mQYYGAprGgPYfLIKbgDDAxH/5OrQ9EG7QWq7VKOZ6iq0B
 fKqKxhgqdvMeGHGZv9iRdK5zgQl4DL2cz06f91IGZ2HGogV6+Az1ExvQ3glGsl1CkmSr
 75r+AK/V57BQDru8nNwBHiA0mW1rY9Md+RvBuC4wOatuDQNCcmnFxjp2EC00sEEgMywO
 4tNQ==
X-Gm-Message-State: AOAM532Sr12YUspP7S6FO/p7A9uN/w6d8zPy9g2q48Bz3fmYTeoVRbhT
 ltg/rL9eCU0kfOHN9NHSLWbxGfUw2ZFDTsx7iNo=
X-Google-Smtp-Source: ABdhPJyQ8+KzBh38nM1VVwl++fObl9pwdTRvDAQgKZhdgmR8gwVtB0RBPVqu+vMfPrkTLAwbcR/rrhj8hdKY8OG/5uk=
X-Received: by 2002:a17:902:324:b029:d8:fdf3:af34 with SMTP id
 33-20020a1709020324b02900d8fdf3af34mr8179239pld.70.1607179650020; Sat, 05 Dec
 2020 06:47:30 -0800 (PST)
MIME-Version: 1.0
References: <20201205103827.31244-1-wanghai38@huawei.com>
In-Reply-To: <20201205103827.31244-1-wanghai38@huawei.com>
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Sat, 5 Dec 2020 20:16:53 +0530
Message-ID: <CAAs3648wsmiJw43BAfigLHC_Sr=9Coubk9b=na0dVNTtNwFqXA@mail.gmail.com>
To: Wang Hai <wanghai38@huawei.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, aibhav.sr@gmail.com,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: audio: Fix possible
 leak free widgets in gbaudio_dapm_free_controls
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

T24gU2F0LCBEZWMgNSwgMjAyMCBhdCA0OjAyIFBNIFdhbmcgSGFpIDx3YW5naGFpMzhAaHVhd2Vp
LmNvbT4gd3JvdGU6Cj4KPiBJbiBnYmF1ZGlvX2RhcG1fZnJlZV9jb250cm9scygpLCBpZiBvbmUg
b2YgdGhlIHdpZGdldHMgaXMgbm90IGZvdW5kLCBhbiBlcnJvcgo+IHdpbGwgYmUgcmV0dXJuZWQg
ZGlyZWN0bHksIHdoaWNoIHdpbGwgY2F1c2UgdGhlIHJlc3QgdG8gYmUgdW5hYmxlIHRvIGJlIGZy
ZWVkLAo+IHJlc3VsdGluZyBpbiBsZWFrLgo+Cj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgYnVnLiBJ
ZiBpZiBvbmUgb2YgdGhlbSBpcyBub3QgZm91bmQsIGp1c3Qgc2tpcCBhbmQgZnJlZSB0aGUgb3Ro
ZXJzLgo+CgpuaXQsIHR5cG8gZXJyb3IgIklmIGlmIG9uZSIuCgo+IEZpeGVzOiA1MTBlMzQwZWZl
MGMgKCJzdGFnaW5nOiBncmV5YnVzOiBhdWRpbzogQWRkIGhlbHBlciBBUElzIGZvciBkeW5hbWlj
IGF1ZGlvIG1vZHVsZSIpCj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWku
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgSGFpIDx3YW5naGFpMzhAaHVhd2VpLmNvbT4KPiAt
LS0KClJldmlld2VkLWJ5OiBWYWliaGF2IEFnYXJ3YWwgPHZhaWJoYXYuc3JAZ21haWwuY29tPgoK
LS0KdGhhbmtzLAp2YWliaGF2Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5h
cm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMt
ZGV2Cg==
