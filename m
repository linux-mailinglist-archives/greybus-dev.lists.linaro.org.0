Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB3431CB7C
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 14:53:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C11EB6600D
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 13:53:51 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B2E9B66520; Tue, 16 Feb 2021 13:53:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E757B6675F;
	Tue, 16 Feb 2021 13:52:35 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3301B6675F
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 22:50:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 19FC766765; Fri, 12 Feb 2021 22:50:39 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by lists.linaro.org (Postfix) with ESMTPS id 2884A6675F
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 22:50:38 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id n10so1208622wmq.0
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 14:50:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=ZIZJUfWDlLORZK0UXURRJwtXDOvF3/jQeszDnimKc2E=;
 b=NVL+qQuIlW5xCVx37aD6PYlNfn3X29h83cGLUNtBQYuHOfhjfFASukp7lC+snJ3fud
 0s+glaaHWfprC7D86GYSJjj5O9f3E4tBJLD+Hfb4qwDhThTdjgKNX2n8q1GMmC5gjeOZ
 NIboUrGMXTzUEByhtaoSkHC/Iu+fzAGdRaC4M6xGsdGh91e6ikLAhtJvLXnUaxiBGXBB
 KK2W9uFTEoKgUmPVlWNv8ASE6VZCcPrDGyXWLMTg+1GfebGKC3pR8tSHPCCetjQhJX1w
 zyqEWUWZH5BSBeLM6n5/qzYvkKCLudHpkS8mFAjgIwjBdLbZO2wzKgXc67UXohkhqKU+
 +D+A==
X-Gm-Message-State: AOAM531+Xd2LjuOZgvz4qdJ1dJ/WHIaW1l8Qko35NVMhYQ3czvy+EcYk
 bjCIrIwS0toBpJVi63zhhec=
X-Google-Smtp-Source: ABdhPJy0ReC4VJ99s5vEC716BPZHdpScjenDjhzBUx63wtqEwRYuxt+tNDimGWIcv+rec+H8dtjN3A==
X-Received: by 2002:a05:600c:4f46:: with SMTP id
 m6mr4476965wmq.160.1613170237116; 
 Fri, 12 Feb 2021 14:50:37 -0800 (PST)
Received: from whach (x4dbd50ef.dyn.telefonica.de. [77.189.80.239])
 by smtp.gmail.com with ESMTPSA id l38sm14865052wmp.19.2021.02.12.14.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 14:50:36 -0800 (PST)
Date: Sat, 13 Feb 2021 04:20:35 +0530
From: Manikantan Ravichandran <ravman1991@gmail.com>
To: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org
Message-ID: <20210212225035.GA16260@whach>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 16 Feb 2021 13:52:33 +0000
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH] staging: greybus: minor code style fix
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

Y2hlY2twYXRjaCB3YXJuaW5nIGZpeCBmb3Igc3RyaW5nIHNwbGl0IGFjcm9zcyBsaW5lcwoKU2ln
bmVkLW9mZi1ieTogTWFuaWthbnRhbiBSYXZpY2hhbmRyYW4gPHJhdm1hbjE5OTFAZ21haWwuY29t
PgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX21hbmFnZXJfc3lzZnMuYyB8IDQg
KystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyX3N5c2ZzLmMg
Yi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyX3N5c2ZzLmMKaW5kZXggYWI4
ODJjYzQ5YjQxLi5mY2Q1MThmOTU0MGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL2F1ZGlvX21hbmFnZXJfc3lzZnMuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9h
dWRpb19tYW5hZ2VyX3N5c2ZzLmMKQEAgLTE4LDggKzE4LDggQEAgc3RhdGljIHNzaXplX3QgbWFu
YWdlcl9zeXNmc19hZGRfc3RvcmUoc3RydWN0IGtvYmplY3QgKmtvYmosCiAJc3RydWN0IGdiX2F1
ZGlvX21hbmFnZXJfbW9kdWxlX2Rlc2NyaXB0b3IgZGVzYyA9IHsgezB9IH07CiAKIAlpbnQgbnVt
ID0gc3NjYW5mKGJ1ZiwKLQkJCSJuYW1lPSUiIEdCX0FVRElPX01BTkFHRVJfTU9EVUxFX05BTUVf
TEVOX1NTQ0FORiAicyAiCi0JCQkidmlkPSVkIHBpZD0lZCBpbnRmX2lkPSVkIGkvcCBkZXZpY2Vz
PTB4JVggby9wIGRldmljZXM9MHglWCIsCisJCQkibmFtZT0lIiBHQl9BVURJT19NQU5BR0VSX01P
RFVMRV9OQU1FX0xFTl9TU0NBTkYKKwkJCSJzIHZpZD0lZCBwaWQ9JWQgaW50Zl9pZD0lZCBpL3Ag
ZGV2aWNlcz0weCVYIG8vcCBkZXZpY2VzPTB4JVgiLAogCQkJZGVzYy5uYW1lLCAmZGVzYy52aWQs
ICZkZXNjLnBpZCwgJmRlc2MuaW50Zl9pZCwKIAkJCSZkZXNjLmlwX2RldmljZXMsICZkZXNjLm9w
X2RldmljZXMpOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0
cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dy
ZXlidXMtZGV2Cg==
