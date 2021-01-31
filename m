Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 9377A30A0F7
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 05:55:12 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B0385667A1
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 04:55:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 9E1FB667A2; Mon,  1 Feb 2021 04:55:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D4E5F667C8;
	Mon,  1 Feb 2021 04:52:51 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 47A496600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:32:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3511766460; Sun, 31 Jan 2021 17:32:50 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by lists.linaro.org (Postfix) with ESMTPS id 3B7D86600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:32:49 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id s23so9152412pgh.11
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 09:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mo0+brrhGMjJednSGVa7WEJAUXKYi42r2CVW4s4Y5xs=;
 b=HYCYGpOhWVWcZjvGwvNNjkRVTQ1JrrSwFOW63Gqp5PQ0hE1hPD39ADcisC5dMMAXLa
 BtBzwyeiQfxQqjMC5kI9KsbAuy7rvFiUO0FGE+1mU/vmsg+DYu14Li5VATmFBo5ARH+7
 qyeyQAdr6w5M5sNlUk0p9YDupg7VQCWhiWyWDZIYMAS2c66eMnwzuDlelpOsXO4fZarY
 mFL7B6N/AU9bostUean34echqQj2PE8DNxJx1+3qYlex63KK4jAjF/NpGc1deNOrZeSH
 JEoL5wLRhIiLwhYlhDXwtmgKexdyeuTWXnwK+LS38RUfTOod2uvrS6j+79BhsJcYOBHL
 D+nw==
X-Gm-Message-State: AOAM530zyes7v6ZtZp8djXuHEnk8V7DPoqpAobDNotYD+alvoN4Jw5YN
 dALyjR3nWmZdsQwRvZlPYvY=
X-Google-Smtp-Source: ABdhPJwcxoFrwI/FRC06emoEJxOlhapapq3uXAbaNvZgMSxCrsCYsYe4eF797A5mhxRg8Rzkb7s87g==
X-Received: by 2002:a62:ae0c:0:b029:1bc:a0b9:f0aa with SMTP id
 q12-20020a62ae0c0000b02901bca0b9f0aamr12613811pff.78.1612114368491; 
 Sun, 31 Jan 2021 09:32:48 -0800 (PST)
Received: from localhost ([2402:3a80:11ea:e144:a2a4:c5ff:fe20:7222])
 by smtp.gmail.com with ESMTPSA id f71sm14799711pfa.138.2021.01.31.09.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 09:32:47 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
Date: Sun, 31 Jan 2021 22:58:31 +0530
Message-Id: <20210131172838.146706-11-memxor@gmail.com>
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
Subject: [greybus-dev] [PATCH 10/13] staging: rtl8192u: Switch from strlcpy
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
ODE5MnUvaWVlZTgwMjExL2llZWU4MDIxMV9zb2Z0bWFjX3d4LmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3N0YWdpbmcvcnRsODE5MnUvaWVlZTgwMjExL2llZWU4MDIxMV9zb2Z0bWFjX3d4LmMgYi9kcml2
ZXJzL3N0YWdpbmcvcnRsODE5MnUvaWVlZTgwMjExL2llZWU4MDIxMV9zb2Z0bWFjX3d4LmMKaW5k
ZXggZjQzNGEyNmNkLi5hZmE5MmRkZmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ydGw4
MTkydS9pZWVlODAyMTEvaWVlZTgwMjExX3NvZnRtYWNfd3guYworKysgYi9kcml2ZXJzL3N0YWdp
bmcvcnRsODE5MnUvaWVlZTgwMjExL2llZWU4MDIxMV9zb2Z0bWFjX3d4LmMKQEAgLTQ4NCw3ICs0
ODQsNyBAQCBpbnQgaWVlZTgwMjExX3d4X2dldF9uYW1lKHN0cnVjdCBpZWVlODAyMTFfZGV2aWNl
ICppZWVlLAogCQkJICAgICBzdHJ1Y3QgaXdfcmVxdWVzdF9pbmZvICppbmZvLAogCQkJICAgICB1
bmlvbiBpd3JlcV9kYXRhICp3cnF1LCBjaGFyICpleHRyYSkKIHsKLQlzdHJsY3B5KHdycXUtPm5h
bWUsICI4MDIuMTEiLCBJRk5BTVNJWik7CisJc3Ryc2NweSh3cnF1LT5uYW1lLCAiODAyLjExIiwg
SUZOQU1TSVopOwogCWlmIChpZWVlLT5tb2R1bGF0aW9uICYgSUVFRTgwMjExX0NDS19NT0RVTEFU
SU9OKSB7CiAJCXN0cmxjYXQod3JxdS0+bmFtZSwgImIiLCBJRk5BTVNJWik7CiAJCWlmIChpZWVl
LT5tb2R1bGF0aW9uICYgSUVFRTgwMjExX09GRE1fTU9EVUxBVElPTikKLS0gCjIuMjkuMgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYg
bWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5s
aW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
