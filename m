Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 523EC30A0F9
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 05:55:41 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7A1F7667A2
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 04:55:40 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 62BBB667A4; Mon,  1 Feb 2021 04:55:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B00F866799;
	Mon,  1 Feb 2021 04:52:52 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id B96976600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:33:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A6ED266460; Sun, 31 Jan 2021 17:33:11 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by lists.linaro.org (Postfix) with ESMTPS id B33C56600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:33:10 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id md11so8953824pjb.0
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 09:33:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OCqlwfO8Y29nGZpydwpkYYTLuT/Y0WSarB/5hJMpIrI=;
 b=dEdeJkVDu9OYUuNYKLj7swsF41qjFxxS6PFIYZpLJxTc4A7njgplEy6Och9NQCT6zC
 E1q/iazSFtAHZpuaLhylKGBZJ2GplGtpYJlAzaLfhUuMBNYcPCfcBkMv8TD3U3WhIMSW
 ViMxc1SZCYYdnYZzHzcz1InM4TqWppX4oaeg1ROp0ctv3U5rBGbXCP+TLTIqJ59D4u09
 4XXMc85DOKaK1hovVtzMSMSWYund4lA0lnVPVVMipSXCGFns1z5YVUfAwnnPz652BMgA
 DpgFdM27HNrtEvDlYB1nusI9pLvbP/rZ4gXlXcuqKDH4KwHNJ9jhWzEN0MKBK8bYUekn
 a6Mw==
X-Gm-Message-State: AOAM532ZGW3hOZ2Sjc/C5tFCtWI7wpHYA3iLRWRyrWHlhohMprp1UEjt
 5qk2Rh7kfJp6kgoIWfrBGP8=
X-Google-Smtp-Source: ABdhPJxrcDtakyOOGA891Q1rZXY+m90HEiouugXutZuV7hNkCAUtDlwX09zIR5GawshucqOHMUegOw==
X-Received: by 2002:a17:90b:1955:: with SMTP id
 nk21mr8221442pjb.206.1612114390012; 
 Sun, 31 Jan 2021 09:33:10 -0800 (PST)
Received: from localhost ([2402:3a80:11ea:e144:a2a4:c5ff:fe20:7222])
 by smtp.gmail.com with ESMTPSA id r5sm14566058pfl.165.2021.01.31.09.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 09:33:09 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
Date: Sun, 31 Jan 2021 22:58:33 +0530
Message-Id: <20210131172838.146706-13-memxor@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131172838.146706-1-memxor@gmail.com>
References: <20210131172838.146706-1-memxor@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 01 Feb 2021 04:52:47 +0000
Cc: linux-fbdev@vger.kernel.org, Jon Nettleton <jon.nettleton@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Marc Dietrich <marvin24@gmx.de>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Thomas Gleixner <tglx@linutronix.de>,
 ac100@lists.launchpad.net, Stephen Rothwell <sfr@canb.auug.org.au>,
 Florian Fainelli <f.fainelli@gmail.com>, Daniel Drake <dsd@laptop.org>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>,
 Jens Frederich <jfrederich@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Robert Richter <rric@kernel.org>, Johan Hovold <johan@kernel.org>,
 Ian Abbott <abbotti@mev.co.uk>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 linux-tegra@vger.kernel.org, William Cohen <wcohen@redhat.com>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Alex Elder <elder@kernel.org>, Teddy Wang <teddy.wang@siliconmotion.com>,
 greybus-dev@lists.linaro.org, H Hartley Sweeten <hsweeten@visionengravers.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Larry Finger <Larry.Finger@lwfinger.net>
Subject: [greybus-dev] [PATCH 12/13] staging: sm750fb: Switch from strlcpy
	to strscpy
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

c3RybGNweSBpcyBtYXJrZWQgYXMgZGVwcmVjYXRlZCBpbiBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mv
ZGVwcmVjYXRlZC5yc3QsCmFuZCB0aGVyZSBpcyBubyBmdW5jdGlvbmFsIGRpZmZlcmVuY2Ugd2hl
biB0aGUgY2FsbGVyIGV4cGVjdHMgdHJ1bmNhdGlvbgood2hlbiBub3QgY2hlY2tpbmcgdGhlIHJl
dHVybiB2YWx1ZSkuIHN0cnNjcHkgaXMgcmVsYXRpdmVseSBiZXR0ZXIgYXMgaXQKYWxzbyBhdm9p
ZHMgc2Nhbm5pbmcgdGhlIHdob2xlIHNvdXJjZSBzdHJpbmcuCgpUaGlzIHNpbGVuY2VzIHRoZSBy
ZWxhdGVkIGNoZWNrcGF0Y2ggd2FybmluZ3MgZnJvbToKNWRiZGIyZDg3YzI5ICgiY2hlY2twYXRj
aDogcHJlZmVyIHN0cnNjcHkgdG8gc3RybGNweSIpCgpTaWduZWQtb2ZmLWJ5OiBLdW1hciBLYXJ0
aWtleWEgRHdpdmVkaSA8bWVteG9yQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvc203
NTBmYi9zbTc1MC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL3NtNzUwZmIvc203NTAuYyBi
L2RyaXZlcnMvc3RhZ2luZy9zbTc1MGZiL3NtNzUwLmMKaW5kZXggMDI5ZjBkMDllLi5jMjM3YThm
OGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9zbTc1MGZiL3NtNzUwLmMKKysrIGIvZHJp
dmVycy9zdGFnaW5nL3NtNzUwZmIvc203NTAuYwpAQCAtODE0LDcgKzgxNCw3IEBAIHN0YXRpYyBp
bnQgbHlueGZiX3NldF9mYmluZm8oc3RydWN0IGZiX2luZm8gKmluZm8sIGludCBpbmRleCkKIAlm
aXgtPnl3cmFwc3RlcCA9IGNydGMtPnl3cmFwc3RlcDsKIAlmaXgtPmFjY2VsID0gRkJfQUNDRUxf
U01JOwogCi0Jc3RybGNweShmaXgtPmlkLCBmaXhJZFtpbmRleF0sIHNpemVvZihmaXgtPmlkKSk7
CisJc3Ryc2NweShmaXgtPmlkLCBmaXhJZFtpbmRleF0sIHNpemVvZihmaXgtPmlkKSk7CiAKIAlm
aXgtPnNtZW1fc3RhcnQgPSBjcnRjLT5vU2NyZWVuICsgc203NTBfZGV2LT52aWRtZW1fc3RhcnQ7
CiAJcHJfaW5mbygiZml4LT5zbWVtX3N0YXJ0ID0gJWx4XG4iLCBmaXgtPnNtZW1fc3RhcnQpOwot
LSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpo
dHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
