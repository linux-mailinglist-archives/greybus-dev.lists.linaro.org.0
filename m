Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 039C330A0F6
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 05:55:01 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 23E7C667A3
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 04:55:00 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1625A667A4; Mon,  1 Feb 2021 04:55:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A5D39667C4;
	Mon,  1 Feb 2021 04:52:51 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 243856600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:32:40 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 165EB66460; Sun, 31 Jan 2021 17:32:40 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by lists.linaro.org (Postfix) with ESMTPS id 1EBE46600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:32:39 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id h15so8654935pli.8
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 09:32:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UATS+ZdWIHunyokeUQ2KzApxYEhPMU9QywnIQp+k1xo=;
 b=el/+Z29X29atgFj3FtX/6BtBkQmfochNkJ+AIWxaqf2Zb/BOJD9bDyIRPJHFKflhcG
 ohWaNDb5lQMhF2AtankBg6m4raNEQkOonLwsYt2WHHMiuZtvOVwratsansBIMGRP+kL7
 QzVjDoLRg2wDA0WwoCw0CplBnXRYfZK9PlDTXZQKk5cES3iNVGlNEvMlrr/Cu80N0aj7
 Yadg25TQmowcZb9zmZg4RuwlS2FQkjsEHy7wolESA5y0ggeawlgJ0bf7cvzbvtm1X83Z
 FYEyUTikkuJ/3/HJqTlRksOhm+39tRoYEqYWl7jtEwQ0nrZO7vPtV34c33czEgvYQ/on
 3Smw==
X-Gm-Message-State: AOAM532vNT065fJ5bR+nq1YzprjFNeD2b2FxIUOkef0rLlX41t6IUrgD
 DuwS37vXsgGjNvTMDOw4pfY=
X-Google-Smtp-Source: ABdhPJxtoGANsdEpKKge2o/29AN1E8VfPfLdlwcKVddQbVKTDT3+km65hFEkM3txwdasUFD8QbEDvQ==
X-Received: by 2002:a17:90a:778b:: with SMTP id
 v11mr13218923pjk.61.1612114358345; 
 Sun, 31 Jan 2021 09:32:38 -0800 (PST)
Received: from localhost ([2402:3a80:11ea:e144:a2a4:c5ff:fe20:7222])
 by smtp.gmail.com with ESMTPSA id y16sm15492888pfb.83.2021.01.31.09.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 09:32:37 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
Date: Sun, 31 Jan 2021 22:58:30 +0530
Message-Id: <20210131172838.146706-10-memxor@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131172838.146706-1-memxor@gmail.com>
References: <20210131172838.146706-1-memxor@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 01 Feb 2021 04:52:47 +0000
Cc: linux-fbdev@vger.kernel.org, Jon Nettleton <jon.nettleton@gmail.com>,
 Marc Dietrich <marvin24@gmx.de>, Ioana Ciornei <ioana.ciornei@nxp.com>,
 William Cohen <wcohen@redhat.com>, ac100@lists.launchpad.net,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Florian Fainelli <f.fainelli@gmail.com>, Daniel Drake <dsd@laptop.org>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>,
 Jens Frederich <jfrederich@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Robert Richter <rric@kernel.org>, Johan Hovold <johan@kernel.org>,
 Ian Abbott <abbotti@mev.co.uk>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Alex Elder <elder@kernel.org>, Teddy Wang <teddy.wang@siliconmotion.com>,
 greybus-dev@lists.linaro.org, H Hartley Sweeten <hsweeten@visionengravers.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>
Subject: [greybus-dev] [PATCH 09/13] staging: rtl8192e: Switch from strlcpy
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
aWtleWEgRHdpdmVkaSA8bWVteG9yQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvcnRs
ODE5MmUvcnRsODE5MmUvcnRsX2V0aHRvb2wuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Rh
Z2luZy9ydGw4MTkyZS9ydGw4MTkyZS9ydGxfZXRodG9vbC5jIGIvZHJpdmVycy9zdGFnaW5nL3J0
bDgxOTJlL3J0bDgxOTJlL3J0bF9ldGh0b29sLmMKaW5kZXggNmFlN2E2N2U3Li5mNGY3Yjc0Yzgg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ydGw4MTkyZS9ydGw4MTkyZS9ydGxfZXRodG9v
bC5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ydGw4MTkyZS9ydGw4MTkyZS9ydGxfZXRodG9vbC5j
CkBAIC0xOCw5ICsxOCw5IEBAIHN0YXRpYyB2b2lkIF9ydGw5MmVfZXRodG9vbF9nZXRfZHJ2aW5m
byhzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAogewogCXN0cnVjdCByODE5Ml9wcml2ICpwcml2ID0g
cnRsbGliX3ByaXYoZGV2KTsKIAotCXN0cmxjcHkoaW5mby0+ZHJpdmVyLCBEUlZfTkFNRSwgc2l6
ZW9mKGluZm8tPmRyaXZlcikpOwotCXN0cmxjcHkoaW5mby0+dmVyc2lvbiwgRFJWX1ZFUlNJT04s
IHNpemVvZihpbmZvLT52ZXJzaW9uKSk7Ci0Jc3RybGNweShpbmZvLT5idXNfaW5mbywgcGNpX25h
bWUocHJpdi0+cGRldiksIHNpemVvZihpbmZvLT5idXNfaW5mbykpOworCXN0cnNjcHkoaW5mby0+
ZHJpdmVyLCBEUlZfTkFNRSwgc2l6ZW9mKGluZm8tPmRyaXZlcikpOworCXN0cnNjcHkoaW5mby0+
dmVyc2lvbiwgRFJWX1ZFUlNJT04sIHNpemVvZihpbmZvLT52ZXJzaW9uKSk7CisJc3Ryc2NweShp
bmZvLT5idXNfaW5mbywgcGNpX25hbWUocHJpdi0+cGRldiksIHNpemVvZihpbmZvLT5idXNfaW5m
bykpOwogfQogCiBzdGF0aWMgdTMyIF9ydGw5MmVfZXRodG9vbF9nZXRfbGluayhzdHJ1Y3QgbmV0
X2RldmljZSAqZGV2KQotLSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlz
dHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9n
cmV5YnVzLWRldgo=
