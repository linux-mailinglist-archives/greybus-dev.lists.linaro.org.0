Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C9B30A0F2
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 05:54:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DB8BC6679A
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 04:54:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id CEA256679B; Mon,  1 Feb 2021 04:54:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EA693667B0;
	Mon,  1 Feb 2021 04:52:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DAD7D66067
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:31:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C9B7C6600D; Sun, 31 Jan 2021 17:31:58 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by lists.linaro.org (Postfix) with ESMTPS id A44936600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:31:57 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id t29so9999666pfg.11
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 09:31:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qJkSDHaVmo+fJzrmd85PruQ7oVf+hPtIrZplmqs4FsA=;
 b=kOD47sQ8HHGPp61T+/SpnNQM5P/QyALWiPehEObbguxxpby7dOj3mfJ7zAymgKDH2K
 JCeme81fU5hO1vGvbybY+6xcel+ZziQK66Fe+FhhbabqUzIWrJDOcTpzvuicuTEvf8EQ
 19KNJ+NPqkaswqOgMO6ww6JWMuQLLLXl80O5yexpRxHoatjTfcYBbLi7ldbdfyv4rMKc
 wuUfKBa/YV9385It1e16VQv4NXmqBTvy346hpcn0JjBgNumpK3u4s57T+x/yMCUKVqJw
 3Lkd/WNLwpCNGsLePJw34vE1gTcdV/SCFKZxoVLB0UoT6Kpf2yWxRnsCrGEqPD6cn92k
 4RtA==
X-Gm-Message-State: AOAM532Oi/7MvF3KxTTHB64Smhc6nkVWA2nLmYkCIV/m6oDfLsPFPwqJ
 +hghx2qnwAp4T6M0nHhRNeA=
X-Google-Smtp-Source: ABdhPJx20zg4Eel9orHc/z6tQYJ/L78aqH6IGuvnMGtz2Lor1bTYfNI80zv9b09QNyvsIwBHoDcw5w==
X-Received: by 2002:a62:32c3:0:b029:1bc:7e0:ae66 with SMTP id
 y186-20020a6232c30000b02901bc07e0ae66mr13089095pfy.53.1612114316906; 
 Sun, 31 Jan 2021 09:31:56 -0800 (PST)
Received: from localhost ([2402:3a80:11ea:e144:a2a4:c5ff:fe20:7222])
 by smtp.gmail.com with ESMTPSA id z2sm5127218pfa.121.2021.01.31.09.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 09:31:56 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
Date: Sun, 31 Jan 2021 22:58:26 +0530
Message-Id: <20210131172838.146706-6-memxor@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131172838.146706-1-memxor@gmail.com>
References: <20210131172838.146706-1-memxor@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 01 Feb 2021 04:52:47 +0000
Cc: linux-fbdev@vger.kernel.org, Jon Nettleton <jon.nettleton@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Marc Dietrich <marvin24@gmx.de>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, William Cohen <wcohen@redhat.com>,
 ac100@lists.launchpad.net, Stephen Rothwell <sfr@canb.auug.org.au>,
 Florian Fainelli <f.fainelli@gmail.com>, Daniel Drake <dsd@laptop.org>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>,
 Jens Frederich <jfrederich@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Robert Richter <rric@kernel.org>, Johan Hovold <johan@kernel.org>,
 Ian Abbott <abbotti@mev.co.uk>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Alex Elder <elder@kernel.org>, Teddy Wang <teddy.wang@siliconmotion.com>,
 greybus-dev@lists.linaro.org, H Hartley Sweeten <hsweeten@visionengravers.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Larry Finger <Larry.Finger@lwfinger.net>
Subject: [greybus-dev] [PATCH 05/13] staging: nvec: Switch from strlcpy to
	strscpy
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
aWtleWEgRHdpdmVkaSA8bWVteG9yQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvbnZl
Yy9udmVjX3BzMi5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9udmVjL252ZWNfcHMy
LmMgYi9kcml2ZXJzL3N0YWdpbmcvbnZlYy9udmVjX3BzMi5jCmluZGV4IDQ1ZGIyOTI2Mi4uMTU3
MDA5MDE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvbnZlYy9udmVjX3BzMi5jCisrKyBi
L2RyaXZlcnMvc3RhZ2luZy9udmVjL252ZWNfcHMyLmMKQEAgLTExMiw4ICsxMTIsOCBAQCBzdGF0
aWMgaW50IG52ZWNfbW91c2VfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlz
ZXJfZGV2LT5zdGFydCA9IHBzMl9zdGFydHN0cmVhbWluZzsKIAlzZXJfZGV2LT5zdG9wID0gcHMy
X3N0b3BzdHJlYW1pbmc7CiAKLQlzdHJsY3B5KHNlcl9kZXYtPm5hbWUsICJudmVjIG1vdXNlIiwg
c2l6ZW9mKHNlcl9kZXYtPm5hbWUpKTsKLQlzdHJsY3B5KHNlcl9kZXYtPnBoeXMsICJudmVjIiwg
c2l6ZW9mKHNlcl9kZXYtPnBoeXMpKTsKKwlzdHJzY3B5KHNlcl9kZXYtPm5hbWUsICJudmVjIG1v
dXNlIiwgc2l6ZW9mKHNlcl9kZXYtPm5hbWUpKTsKKwlzdHJzY3B5KHNlcl9kZXYtPnBoeXMsICJu
dmVjIiwgc2l6ZW9mKHNlcl9kZXYtPnBoeXMpKTsKIAogCXBzMl9kZXYuc2VyX2RldiA9IHNlcl9k
ZXY7CiAJcHMyX2Rldi5ub3RpZmllci5ub3RpZmllcl9jYWxsID0gbnZlY19wczJfbm90aWZpZXI7
Ci0tIAoyLjI5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3Jn
Cmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
