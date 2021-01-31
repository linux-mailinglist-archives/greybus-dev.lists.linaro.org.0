Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A1C30A0F1
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 05:53:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 234E16679A
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 04:53:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 14D186679B; Mon,  1 Feb 2021 04:53:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AC647667AC;
	Mon,  1 Feb 2021 04:52:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 773EE66067
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:31:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 61B7B6600D; Sun, 31 Jan 2021 17:31:48 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by lists.linaro.org (Postfix) with ESMTPS id 552E76600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:31:47 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id z9so987893pjl.5
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 09:31:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YAFVqpo2auTJUYrtqcdZaCPT+PUXtqA1yzZi4A7sg2M=;
 b=o4kReF5mCwF1lgr+gJcMsBIYuDPId5g4ijoL90Y43BHQ8ukh45hfgs4Fci5rdQCV+U
 rF7elVIGP6NDEoAzeZED7uLp0IIZl9gL3kPXKWOc7dQfgUhMhM0UkeKq+jtXiTywiv5X
 edin7udfO3EVchvjZALReSva0Vgt2uR1FsgIUNVA0XECguepKLM52DZAd8u3FpMHok6v
 Oal8Ibk+2n57+cfYD0oOnpye4z6zCJlbv27ixbwXbqqKaCSRTu94VorI5sQu/euv1h4U
 4CSCqVbEJyNI2dYnkxtj5hDKYg+5gL83L43Y+7IL1dLPRLQ9oAIpoHmoxM9B1ncOIlLe
 +JVg==
X-Gm-Message-State: AOAM532QozOdVYfk7o3w43UitzCyKd/E1g02E9t140JazlYI5zd9v0dn
 KEMFbeVb7TwWH3mk0TUlY00=
X-Google-Smtp-Source: ABdhPJydIpBl27zWlFzSU3IhagnDXZPJq2whmVIc4lQaYyGAyMUbLfRKz+PJcImBlqe99k/sZnqEYw==
X-Received: by 2002:a17:90a:7608:: with SMTP id
 s8mr6952392pjk.105.1612114306505; 
 Sun, 31 Jan 2021 09:31:46 -0800 (PST)
Received: from localhost ([2402:3a80:11ea:e144:a2a4:c5ff:fe20:7222])
 by smtp.gmail.com with ESMTPSA id ge16sm12997426pjb.41.2021.01.31.09.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 09:31:45 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
Date: Sun, 31 Jan 2021 22:58:25 +0530
Message-Id: <20210131172838.146706-5-memxor@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131172838.146706-1-memxor@gmail.com>
References: <20210131172838.146706-1-memxor@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 01 Feb 2021 04:52:47 +0000
Cc: linux-fbdev@vger.kernel.org, Jon Nettleton <jon.nettleton@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Marc Dietrich <marvin24@gmx.de>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, ac100@lists.launchpad.net,
 Stephen Rothwell <sfr@canb.auug.org.au>,
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
Subject: [greybus-dev] [PATCH 04/13] staging: most: Switch from strlcpy to
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
aWtleWEgRHdpdmVkaSA8bWVteG9yQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvbW9z
dC9zb3VuZC9zb3VuZC5jIHwgMiArLQogZHJpdmVycy9zdGFnaW5nL21vc3QvdmlkZW8vdmlkZW8u
YyB8IDYgKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvbW9zdC9zb3VuZC9zb3VuZC5jIGIv
ZHJpdmVycy9zdGFnaW5nL21vc3Qvc291bmQvc291bmQuYwppbmRleCAzYTFhNTkwNTguLmM0Mjg3
OTk0YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL21vc3Qvc291bmQvc291bmQuYworKysg
Yi9kcml2ZXJzL3N0YWdpbmcvbW9zdC9zb3VuZC9zb3VuZC5jCkBAIC01MjUsNyArNTI1LDcgQEAg
c3RhdGljIGludCBhdWRpb19wcm9iZV9jaGFubmVsKHN0cnVjdCBtb3N0X2ludGVyZmFjZSAqaWZh
Y2UsIGludCBjaGFubmVsX2lkLAogCQlwcl9lcnIoIkluY29tcGF0aWJsZSBjaGFubmVsIHR5cGVc
biIpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9Ci0Jc3RybGNweShhcmdfbGlzdF9jcHksIGFyZ19s
aXN0LCBTVFJJTkdfU0laRSk7CisJc3Ryc2NweShhcmdfbGlzdF9jcHksIGFyZ19saXN0LCBTVFJJ
TkdfU0laRSk7CiAJcmV0ID0gc3BsaXRfYXJnX2xpc3QoYXJnX2xpc3RfY3B5LCAmY2hfbnVtLCAm
c2FtcGxlX3Jlcyk7CiAJaWYgKHJldCA8IDApCiAJCXJldHVybiByZXQ7CmRpZmYgLS1naXQgYS9k
cml2ZXJzL3N0YWdpbmcvbW9zdC92aWRlby92aWRlby5jIGIvZHJpdmVycy9zdGFnaW5nL21vc3Qv
dmlkZW8vdmlkZW8uYwppbmRleCA4MjlkZjg5OWIuLjkwOTMzZDc4YyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9zdGFnaW5nL21vc3QvdmlkZW8vdmlkZW8uYworKysgYi9kcml2ZXJzL3N0YWdpbmcvbW9z
dC92aWRlby92aWRlby5jCkBAIC0yNDUsOCArMjQ1LDggQEAgc3RhdGljIGludCB2aWRpb2NfcXVl
cnljYXAoc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKnByaXYsCiAJc3RydWN0IGNvbXBfZmggKmZo
ID0gcHJpdjsKIAlzdHJ1Y3QgbW9zdF92aWRlb19kZXYgKm1kZXYgPSBmaC0+bWRldjsKIAotCXN0
cmxjcHkoY2FwLT5kcml2ZXIsICJ2NGwyX2NvbXBvbmVudCIsIHNpemVvZihjYXAtPmRyaXZlcikp
OwotCXN0cmxjcHkoY2FwLT5jYXJkLCAiTU9TVCIsIHNpemVvZihjYXAtPmNhcmQpKTsKKwlzdHJz
Y3B5KGNhcC0+ZHJpdmVyLCAidjRsMl9jb21wb25lbnQiLCBzaXplb2YoY2FwLT5kcml2ZXIpKTsK
KwlzdHJzY3B5KGNhcC0+Y2FyZCwgIk1PU1QiLCBzaXplb2YoY2FwLT5jYXJkKSk7CiAJc25wcmlu
dGYoY2FwLT5idXNfaW5mbywgc2l6ZW9mKGNhcC0+YnVzX2luZm8pLAogCQkgIiVzIiwgbWRldi0+
aWZhY2UtPmRlc2NyaXB0aW9uKTsKIAlyZXR1cm4gMDsKQEAgLTQ4Myw3ICs0ODMsNyBAQCBzdGF0
aWMgaW50IGNvbXBfcHJvYmVfY2hhbm5lbChzdHJ1Y3QgbW9zdF9pbnRlcmZhY2UgKmlmYWNlLCBp
bnQgY2hhbm5lbF9pZHgsCiAJbWRldi0+djRsMl9kZXYucmVsZWFzZSA9IGNvbXBfdjRsMl9kZXZf
cmVsZWFzZTsKIAogCS8qIENyZWF0ZSB0aGUgdjRsMl9kZXZpY2UgKi8KLQlzdHJsY3B5KG1kZXYt
PnY0bDJfZGV2Lm5hbWUsIG5hbWUsIHNpemVvZihtZGV2LT52NGwyX2Rldi5uYW1lKSk7CisJc3Ry
c2NweShtZGV2LT52NGwyX2Rldi5uYW1lLCBuYW1lLCBzaXplb2YobWRldi0+djRsMl9kZXYubmFt
ZSkpOwogCXJldCA9IHY0bDJfZGV2aWNlX3JlZ2lzdGVyKE5VTEwsICZtZGV2LT52NGwyX2Rldik7
CiAJaWYgKHJldCkgewogCQlwcl9lcnIoInY0bDJfZGV2aWNlX3JlZ2lzdGVyKCkgZmFpbGVkXG4i
KTsKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5v
cmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
