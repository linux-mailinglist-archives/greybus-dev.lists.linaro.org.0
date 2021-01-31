Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 1392130A0EE
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 05:53:21 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 328A66679A
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 04:53:20 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1EB7D6679B; Mon,  1 Feb 2021 04:53:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6B355667A0;
	Mon,  1 Feb 2021 04:52:49 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A348F6600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:31:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 94D9866460; Sun, 31 Jan 2021 17:31:05 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by lists.linaro.org (Postfix) with ESMTPS id AE8076600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:31:04 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id n10so10406319pgl.10
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 09:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NsrHxAV5PZRT0YgTo4A1rjxZSTbbsgPPfPS9F8n4M0s=;
 b=b3bSiwcSwfUaUFTdasbVB+L+PchmpDDHkCnY9FV7fx8oEf6gvqwrL9K2WosN3Nmt14
 tXDYEEOhTiVxnbH7w4+BNdW4F1XageRU+umAFjPoAbhz7Rxt7m1tqNgkK1EhzeAP2mhC
 K3e6uqCwH/0opQCjPzWyW+54p2NYX7G+yGT1QYjCDEkXIdmXPJ7+sPGSR0c4NGAWJtYx
 Vb0CYobZgs9juPq/nvSzWHDDuAS4HeBp5xp6GNYNQIykmo3d51TGki7YqQtXZKfessea
 hEuj5OBYNEzfScglWbVOKwRtBPk4FIGRpt97kcFBVxxKRFQ61+5WbaLVUPV8qEszYuVH
 lIzQ==
X-Gm-Message-State: AOAM532sMsl5bdLTBe0vJ94jCF+qgASt/oTDQODwUdAwl5gTsiEVpOn+
 fxv7gO+qPBpD9+5pcruv0N4=
X-Google-Smtp-Source: ABdhPJzda11kt+qccbnF1yfOwNWF3nMY2iL53BppiuYflQwHqJhYz7LlOJWZ4ynLYwJZqbjXTkkFXg==
X-Received: by 2002:a62:5505:0:b029:1c9:2c59:b1ff with SMTP id
 j5-20020a6255050000b02901c92c59b1ffmr12194567pfb.69.1612114263947; 
 Sun, 31 Jan 2021 09:31:03 -0800 (PST)
Received: from localhost ([2402:3a80:11ea:e144:a2a4:c5ff:fe20:7222])
 by smtp.gmail.com with ESMTPSA id a12sm1929409pjs.53.2021.01.31.09.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 09:31:03 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
Date: Sun, 31 Jan 2021 22:58:22 +0530
Message-Id: <20210131172838.146706-2-memxor@gmail.com>
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
Subject: [greybus-dev] [PATCH 01/13] staging: comedi: Switch from strlcpy to
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
aWtleWEgRHdpdmVkaSA8bWVteG9yQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvY29t
ZWRpL2NvbWVkaV9mb3BzLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2NvbWVkaS9j
b21lZGlfZm9wcy5jIGIvZHJpdmVycy9zdGFnaW5nL2NvbWVkaS9jb21lZGlfZm9wcy5jCmluZGV4
IDgwZDc0Y2NlMi4uZGY3N2I2YmY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvY29tZWRp
L2NvbWVkaV9mb3BzLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2NvbWVkaS9jb21lZGlfZm9wcy5j
CkBAIC05MzksOCArOTM5LDggQEAgc3RhdGljIGludCBkb19kZXZpbmZvX2lvY3RsKHN0cnVjdCBj
b21lZGlfZGV2aWNlICpkZXYsCiAJLyogZmlsbCBkZXZpbmZvIHN0cnVjdHVyZSAqLwogCWRldmlu
Zm8udmVyc2lvbl9jb2RlID0gQ09NRURJX1ZFUlNJT05fQ09ERTsKIAlkZXZpbmZvLm5fc3ViZGV2
cyA9IGRldi0+bl9zdWJkZXZpY2VzOwotCXN0cmxjcHkoZGV2aW5mby5kcml2ZXJfbmFtZSwgZGV2
LT5kcml2ZXItPmRyaXZlcl9uYW1lLCBDT01FRElfTkFNRUxFTik7Ci0Jc3RybGNweShkZXZpbmZv
LmJvYXJkX25hbWUsIGRldi0+Ym9hcmRfbmFtZSwgQ09NRURJX05BTUVMRU4pOworCXN0cnNjcHko
ZGV2aW5mby5kcml2ZXJfbmFtZSwgZGV2LT5kcml2ZXItPmRyaXZlcl9uYW1lLCBDT01FRElfTkFN
RUxFTik7CisJc3Ryc2NweShkZXZpbmZvLmJvYXJkX25hbWUsIGRldi0+Ym9hcmRfbmFtZSwgQ09N
RURJX05BTUVMRU4pOwogCiAJcyA9IGNvbWVkaV9maWxlX3JlYWRfc3ViZGV2aWNlKGZpbGUpOwog
CWlmIChzKQotLSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGlu
YXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVz
LWRldgo=
