Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF2D30A0F8
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 05:55:25 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C1619667A1
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 04:55:24 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id AAED7667A3; Mon,  1 Feb 2021 04:55:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4D048667CE;
	Mon,  1 Feb 2021 04:52:52 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 960FD6600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:33:00 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8266A66460; Sun, 31 Jan 2021 17:33:00 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by lists.linaro.org (Postfix) with ESMTPS id 44FEB6600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:32:59 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id n10so10408566pgl.10
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 09:32:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gKI25e/jJLfDV6Kg+PuHK7AdOezrhXeGKxAKRdL5O5c=;
 b=oA2DK+rFlS0S3zRFZKBtYLjyqZM3kS+Fd+nI4MWokRFs2coRwl+u6QUdRh9iAHcZKq
 h4zQmoI+voVEdcJAPrvwxWv+YUGaTTmSWorkf+Sp2ic0bxQyzhbIztqsj+SV84s2op06
 btTsHKadWW0bXNOQ8xe6hQKK93c/AUPOVEM7BWKjemsN/k00/wNz/nWpI6AmvyeqIOBT
 nule+GgKyM9C1aO0fp9kT4f9KNdn7EAgj55m0feeoK8T3SF89Yf1z+XM9DfeGuQz+c0Q
 p3QJdb+cYcFSnbJv7UbQENHAB4ongzPEKbm7zpDUqkH7B9yKX9pfnqAaw+bcGGo3XlbV
 zHag==
X-Gm-Message-State: AOAM531rOonQGwqbIeYPmCNt0s929pvz2pdYCSj4B0OaPFCUxkZThwwU
 eBPtBeuuzfHhTllg5UTWY9U=
X-Google-Smtp-Source: ABdhPJxJdjPPIgHhUA+gd6c590Us77Rv3SAo0M63OGyZ3eELnR08dADDz7f1OMchhqa7A2U6TYf6aw==
X-Received: by 2002:a62:7b8a:0:b029:1bb:4a06:bb57 with SMTP id
 w132-20020a627b8a0000b02901bb4a06bb57mr12418121pfc.47.1612114378549; 
 Sun, 31 Jan 2021 09:32:58 -0800 (PST)
Received: from localhost ([2402:3a80:11ea:e144:a2a4:c5ff:fe20:7222])
 by smtp.gmail.com with ESMTPSA id a141sm15124191pfa.189.2021.01.31.09.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 09:32:58 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
Date: Sun, 31 Jan 2021 22:58:32 +0530
Message-Id: <20210131172838.146706-12-memxor@gmail.com>
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
Subject: [greybus-dev] [PATCH 11/13] staging: rtl8712: Switch from strlcpy
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
ODcxMi9ydGw4NzF4X2lvY3RsX2xpbnV4LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvcnRs
ODcxMi9ydGw4NzF4X2lvY3RsX2xpbnV4LmMgYi9kcml2ZXJzL3N0YWdpbmcvcnRsODcxMi9ydGw4
NzF4X2lvY3RsX2xpbnV4LmMKaW5kZXggY2JhYTdhNDg5Li44MWRlNWE5ZTYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvc3RhZ2luZy9ydGw4NzEyL3J0bDg3MXhfaW9jdGxfbGludXguYworKysgYi9kcml2
ZXJzL3N0YWdpbmcvcnRsODcxMi9ydGw4NzF4X2lvY3RsX2xpbnV4LmMKQEAgLTE3ODQsNyArMTc4
NCw3IEBAIHN0YXRpYyBpbnQgcjg3MXhfd3hfc2V0X2VuY19leHQoc3RydWN0IG5ldF9kZXZpY2Ug
KmRldiwKIAkJcmV0dXJuIC1FTk9NRU07CiAJcGFyYW0tPmNtZCA9IElFRUVfQ01EX1NFVF9FTkNS
WVBUSU9OOwogCWV0aF9icm9hZGNhc3RfYWRkcihwYXJhbS0+c3RhX2FkZHIpOwotCXN0cmxjcHko
KGNoYXIgKilwYXJhbS0+dS5jcnlwdC5hbGcsIGFsZ19uYW1lLCBJRUVFX0NSWVBUX0FMR19OQU1F
X0xFTik7CisJc3Ryc2NweSgoY2hhciAqKXBhcmFtLT51LmNyeXB0LmFsZywgYWxnX25hbWUsIElF
RUVfQ1JZUFRfQUxHX05BTUVfTEVOKTsKIAlpZiAocGV4dC0+ZXh0X2ZsYWdzICYgSVdfRU5DT0RF
X0VYVF9HUk9VUF9LRVkpCiAJCXBhcmFtLT51LmNyeXB0LnNldF90eCA9IDA7CiAJaWYgKHBleHQt
PmV4dF9mbGFncyAmIElXX0VOQ09ERV9FWFRfU0VUX1RYX0tFWSkKLS0gCjIuMjkuMgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFp
bGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5h
cm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
