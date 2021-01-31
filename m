Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DDF30A0F4
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 05:54:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 94075667A1
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 04:54:37 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 80F6A667A2; Mon,  1 Feb 2021 04:54:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 59350667BA;
	Mon,  1 Feb 2021 04:52:51 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C849066067
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:32:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id B9F936600D; Sun, 31 Jan 2021 17:32:18 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by lists.linaro.org (Postfix) with ESMTPS id C25746600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:32:17 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i63so10000596pfg.7
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 09:32:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9mx9QDkqfNUwWdACyM2Fn2TS+NlXzO5XMeT4wvvF4yM=;
 b=maPU7mnfkj4pVJx9Gu1QJQzoYpvD+CT33+8g02AMQkrWL1tENDtpfq7kXUStTFHmbk
 uuWBiaGrj9XiMDlhnzyvBeglru8WEglzWvYx9ahR7umCejYJaxHfNmNvKqT8IYkzjvr6
 k4xqKB0s370KV1MG56LhMJQmi+536ZxG5nCBOtJgSdoyUyQgpwlLu/adSqdcQSdT3vyP
 S7ZgqQ/0W4k9YReodWLeyotaPtR+4xgeJVza8XL+CqY4rRNN6MA4zGqDBIwlMs2iUD0q
 wm2Uj4YBQG0r2PaEcYVxAgYaMsaSeYVXUgmetEp9FNJDX+TRw0z/yX5ch9V0r+7XzeHY
 Fb1g==
X-Gm-Message-State: AOAM530fg4RCQ5v9ky5KAW6i/QH+e8WjgrDQjYgXb5ciB+ndC2e+AaeP
 TWuTTPq0mg1UqU9b7u2KagY=
X-Google-Smtp-Source: ABdhPJy0FOOeBvw8A30nFmOClcs73UGIMxJUMDIk2k6K7lguT0DTnIX/42iZkIg0q78K2sAG9Txfpw==
X-Received: by 2002:a63:c43:: with SMTP id 3mr13088289pgm.250.1612114337079;
 Sun, 31 Jan 2021 09:32:17 -0800 (PST)
Received: from localhost ([2402:3a80:11ea:e144:a2a4:c5ff:fe20:7222])
 by smtp.gmail.com with ESMTPSA id y11sm14165281pfn.85.2021.01.31.09.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 09:32:16 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
Date: Sun, 31 Jan 2021 22:58:28 +0530
Message-Id: <20210131172838.146706-8-memxor@gmail.com>
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
Subject: [greybus-dev] [PATCH 07/13] staging: olpc_dcon: Switch from strlcpy
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
aWtleWEgRHdpdmVkaSA8bWVteG9yQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvb2xw
Y19kY29uL29scGNfZGNvbi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL29scGNfZGNvbi9v
bHBjX2Rjb24uYyBiL2RyaXZlcnMvc3RhZ2luZy9vbHBjX2Rjb24vb2xwY19kY29uLmMKaW5kZXgg
ZTcyODEyMTJkLi42ZDhlOWE0ODEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9vbHBjX2Rj
b24vb2xwY19kY29uLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL29scGNfZGNvbi9vbHBjX2Rjb24u
YwpAQCAtNTc2LDcgKzU3Niw3IEBAIHN0YXRpYyBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgZGNvbl9w
YW5pY19uYiA9IHsKIAogc3RhdGljIGludCBkY29uX2RldGVjdChzdHJ1Y3QgaTJjX2NsaWVudCAq
Y2xpZW50LCBzdHJ1Y3QgaTJjX2JvYXJkX2luZm8gKmluZm8pCiB7Ci0Jc3RybGNweShpbmZvLT50
eXBlLCAib2xwY19kY29uIiwgSTJDX05BTUVfU0laRSk7CisJc3Ryc2NweShpbmZvLT50eXBlLCAi
b2xwY19kY29uIiwgSTJDX05BTUVfU0laRSk7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjkuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
