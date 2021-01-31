Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 995FA30A0F3
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 05:54:25 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C74746679A
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 04:54:24 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id AF9356679B; Mon,  1 Feb 2021 04:54:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 29B96667B5;
	Mon,  1 Feb 2021 04:52:51 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4ADD26600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:32:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3D40966460; Sun, 31 Jan 2021 17:32:09 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by lists.linaro.org (Postfix) with ESMTPS id 41CD16600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:32:08 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id s23so2651660pjz.4
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 09:32:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8z7T30JwVaWaq0MDWkzbLRl1Zk2i9+kaaFA/9JES7Xs=;
 b=l+aVFSsJYu4HkIqidbEDrddCtONXyMGDHtMUA+W7m8DAJDlaxJ95afyei9bWV0BRQ9
 GEWgR4GZlsjqqQZRjcMie3YrBayp90dF1esFwD0X4YgvkQ2jgG+H5GfOSgApWEOnPPHZ
 1UZuZ2jc3vlL1NL/vs3HWq+3WFmKrMorUXY/NqSfYKRSj9jfSkx5L9jgaVpSCS86IKJ+
 okdkJSDxYu9ATIXMIwV3QW7Cx1lm7aMsDlFuuLq4Fwm5tPQKDB1ON9GfXsCF4ZpdQ8lk
 qgtqEre4P46MiQkQK81OrQRQdJLJ4VY+peHYzAMxXt7S/Ek10qOIhhMxs5WG59UH5Ooe
 NwpA==
X-Gm-Message-State: AOAM531LbYClQ82nK7jN9h/bnlgw7xCBIDgLT8XzC10LPzjlex4VRkox
 rv/hdN4McNTDOhF80c4LKf4=
X-Google-Smtp-Source: ABdhPJxlrmQpiP0t2W7sFWGvxmRHJQ1EXLzsFuG1+Bm3Y/OPuczoXDBzhNcDmo58qBTT9cFSwqvRTw==
X-Received: by 2002:a17:902:eacb:b029:e1:2de4:72b6 with SMTP id
 p11-20020a170902eacbb02900e12de472b6mr8975072pld.17.1612114327515; 
 Sun, 31 Jan 2021 09:32:07 -0800 (PST)
Received: from localhost ([2402:3a80:11ea:e144:a2a4:c5ff:fe20:7222])
 by smtp.gmail.com with ESMTPSA id 76sm14898291pfz.174.2021.01.31.09.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 09:32:06 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
Date: Sun, 31 Jan 2021 22:58:27 +0530
Message-Id: <20210131172838.146706-7-memxor@gmail.com>
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
Subject: [greybus-dev] [PATCH 06/13] staging: octeon: Switch from strlcpy to
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
aWtleWEgRHdpdmVkaSA8bWVteG9yQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvb2N0
ZW9uL2V0aGVybmV0LW1kaW8uYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9vY3Rl
b24vZXRoZXJuZXQtbWRpby5jIGIvZHJpdmVycy9zdGFnaW5nL29jdGVvbi9ldGhlcm5ldC1tZGlv
LmMKaW5kZXggMGJmNTQ1ODQ5Li4xYmI5MWE5MDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2lu
Zy9vY3Rlb24vZXRoZXJuZXQtbWRpby5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9vY3Rlb24vZXRo
ZXJuZXQtbWRpby5jCkBAIC0yMSw5ICsyMSw5IEBACiBzdGF0aWMgdm9pZCBjdm1fb2N0X2dldF9k
cnZpbmZvKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsCiAJCQkJc3RydWN0IGV0aHRvb2xfZHJ2aW5m
byAqaW5mbykKIHsKLQlzdHJsY3B5KGluZm8tPmRyaXZlciwgS0JVSUxEX01PRE5BTUUsIHNpemVv
ZihpbmZvLT5kcml2ZXIpKTsKLQlzdHJsY3B5KGluZm8tPnZlcnNpb24sIFVUU19SRUxFQVNFLCBz
aXplb2YoaW5mby0+dmVyc2lvbikpOwotCXN0cmxjcHkoaW5mby0+YnVzX2luZm8sICJCdWlsdGlu
Iiwgc2l6ZW9mKGluZm8tPmJ1c19pbmZvKSk7CisJc3Ryc2NweShpbmZvLT5kcml2ZXIsIEtCVUlM
RF9NT0ROQU1FLCBzaXplb2YoaW5mby0+ZHJpdmVyKSk7CisJc3Ryc2NweShpbmZvLT52ZXJzaW9u
LCBVVFNfUkVMRUFTRSwgc2l6ZW9mKGluZm8tPnZlcnNpb24pKTsKKwlzdHJzY3B5KGluZm8tPmJ1
c19pbmZvLCAiQnVpbHRpbiIsIHNpemVvZihpbmZvLT5idXNfaW5mbykpOwogfQogCiBzdGF0aWMg
aW50IGN2bV9vY3RfbndheV9yZXNldChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KQotLSAKMi4yOS4y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVz
LWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xp
c3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
