Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BC330A0F0
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 05:53:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 193296679B
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 04:53:46 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0BDFB6679C; Mon,  1 Feb 2021 04:53:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 54AAE667A8;
	Mon,  1 Feb 2021 04:52:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2F1406600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:31:28 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1D75B66460; Sun, 31 Jan 2021 17:31:28 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by lists.linaro.org (Postfix) with ESMTPS id F14AE6600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:31:26 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id o20so10025569pfu.0
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 09:31:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=elcSuzCsfiYge55RbGFb9kTR1L7/5bJ4aw6jmtvexpM=;
 b=oT97j6fqzVjUwSJQYNSUvrk8mQN1DCkcFPKd6Dy9C//g+Yz8fHnMUk1cC8OfPMGpBi
 2jZORiTB8pTKyQ/sYGwD4z7w8n9s8IMvneaQjc5Te8SfmCEae274TkYP+HSyXr5lu2zi
 UqPnaZa3xP6aY0RtXtrqW3Gb0icF0YYd+xQM940n/SzePwkb2Gq1oCJFpigSe38zgUZ4
 igE+oSR/wIyXt8Iu3wukYL4Qj8H9dgTK/ms8kTQlc3qfxsCpg0nprKr9DlLgDdcbpDJR
 ucrYc5h0avWJQV/o7QO0d6Ta4SPxzQH3cacvCyyOPZG8ZXiVAcVqSCwTROrCbJc+5lUz
 JMYw==
X-Gm-Message-State: AOAM532P2u4WDPlXDjIRx2+hmG7aQ+ZJSrI5r0hD38gebezWBNWn2+1Y
 awPBgKaLm3GeS/MOPR51R/I=
X-Google-Smtp-Source: ABdhPJyxYeeH+ESPtB0JAl+VwK7F+t4XhpvKZBK/qumKbzweqJodO0pWHAslA+k1SpI5/DtlxhBkKQ==
X-Received: by 2002:a63:1a44:: with SMTP id a4mr13091045pgm.41.1612114286266; 
 Sun, 31 Jan 2021 09:31:26 -0800 (PST)
Received: from localhost ([2402:3a80:11ea:e144:a2a4:c5ff:fe20:7222])
 by smtp.gmail.com with ESMTPSA id q22sm15746139pgi.66.2021.01.31.09.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 09:31:25 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
Date: Sun, 31 Jan 2021 22:58:24 +0530
Message-Id: <20210131172838.146706-4-memxor@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131172838.146706-1-memxor@gmail.com>
References: <20210131172838.146706-1-memxor@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 01 Feb 2021 04:52:47 +0000
Cc: linux-fbdev@vger.kernel.org, Jon Nettleton <jon.nettleton@gmail.com>,
 Marc Dietrich <marvin24@gmx.de>, Ioana Ciornei <ioana.ciornei@nxp.com>,
 Thomas Gleixner <tglx@linutronix.de>, ac100@lists.launchpad.net,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Florian Fainelli <f.fainelli@gmail.com>, Daniel Drake <dsd@laptop.org>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>,
 Jens Frederich <jfrederich@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Robert Richter <rric@kernel.org>, Johan Hovold <johan@kernel.org>,
 Ian Abbott <abbotti@mev.co.uk>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-tegra@vger.kernel.org, William Cohen <wcohen@redhat.com>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Alex Elder <elder@kernel.org>, Teddy Wang <teddy.wang@siliconmotion.com>,
 greybus-dev@lists.linaro.org, H Hartley Sweeten <hsweeten@visionengravers.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>
Subject: [greybus-dev] [PATCH 03/13] staging: fsl-dpaa2: Switch from strlcpy
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
aWtleWEgRHdpdmVkaSA8bWVteG9yQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvZnNs
LWRwYWEyL2V0aHN3L2V0aHN3LWV0aHRvb2wuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Rh
Z2luZy9mc2wtZHBhYTIvZXRoc3cvZXRoc3ctZXRodG9vbC5jIGIvZHJpdmVycy9zdGFnaW5nL2Zz
bC1kcGFhMi9ldGhzdy9ldGhzdy1ldGh0b29sLmMKaW5kZXggZDdmNGVkMWRmLi4wYWYyZTk5MTQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9mc2wtZHBhYTIvZXRoc3cvZXRoc3ctZXRodG9v
bC5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9mc2wtZHBhYTIvZXRoc3cvZXRoc3ctZXRodG9vbC5j
CkBAIC0zOCwxOSArMzgsMTkgQEAgc3RhdGljIHZvaWQgZHBhYTJfc3dpdGNoX2dldF9kcnZpbmZv
KHN0cnVjdCBuZXRfZGV2aWNlICpuZXRkZXYsCiAJdTE2IHZlcnNpb25fbWFqb3IsIHZlcnNpb25f
bWlub3I7CiAJaW50IGVycjsKIAotCXN0cmxjcHkoZHJ2aW5mby0+ZHJpdmVyLCBLQlVJTERfTU9E
TkFNRSwgc2l6ZW9mKGRydmluZm8tPmRyaXZlcikpOworCXN0cnNjcHkoZHJ2aW5mby0+ZHJpdmVy
LCBLQlVJTERfTU9ETkFNRSwgc2l6ZW9mKGRydmluZm8tPmRyaXZlcikpOwogCiAJZXJyID0gZHBz
d19nZXRfYXBpX3ZlcnNpb24ocG9ydF9wcml2LT5ldGhzd19kYXRhLT5tY19pbywgMCwKIAkJCQkg
ICAmdmVyc2lvbl9tYWpvciwKIAkJCQkgICAmdmVyc2lvbl9taW5vcik7CiAJaWYgKGVycikKLQkJ
c3RybGNweShkcnZpbmZvLT5md192ZXJzaW9uLCAiTi9BIiwKKwkJc3Ryc2NweShkcnZpbmZvLT5m
d192ZXJzaW9uLCAiTi9BIiwKIAkJCXNpemVvZihkcnZpbmZvLT5md192ZXJzaW9uKSk7CiAJZWxz
ZQogCQlzbnByaW50ZihkcnZpbmZvLT5md192ZXJzaW9uLCBzaXplb2YoZHJ2aW5mby0+ZndfdmVy
c2lvbiksCiAJCQkgIiV1LiV1IiwgdmVyc2lvbl9tYWpvciwgdmVyc2lvbl9taW5vcik7CiAKLQlz
dHJsY3B5KGRydmluZm8tPmJ1c19pbmZvLCBkZXZfbmFtZShuZXRkZXYtPmRldi5wYXJlbnQtPnBh
cmVudCksCisJc3Ryc2NweShkcnZpbmZvLT5idXNfaW5mbywgZGV2X25hbWUobmV0ZGV2LT5kZXYu
cGFyZW50LT5wYXJlbnQpLAogCQlzaXplb2YoZHJ2aW5mby0+YnVzX2luZm8pKTsKIH0KIAotLSAK
Mi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRw
czovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
