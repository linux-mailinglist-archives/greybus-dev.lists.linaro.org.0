Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CAE30A0F5
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 05:54:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 293CA667A1
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 04:54:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1D88C667A2; Mon,  1 Feb 2021 04:54:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7FE57667BF;
	Mon,  1 Feb 2021 04:52:51 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7E3426600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:32:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 6E18B66067; Sun, 31 Jan 2021 17:32:30 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by lists.linaro.org (Postfix) with ESMTPS id E3D5E66460
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:32:27 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id o63so10409133pgo.6
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 09:32:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KL4ClHuz/7I8c1v93iqBuHCJ0LGBrBIt4lTt0h3HcoY=;
 b=h+WGQ8aTCEIVsmkfGdTML2dccK0wQdXvJQbq0SmGy62zCkOePi62FJf5/ydLqTJDW6
 +CQlNXYL/HkqxZytNgSMkztqqnUj9zq/X35MrU6NuNeLFM3LyA985MylBIBHNifqb+VY
 Er5Yfe9wHrEVyD2m+Qys0ufyVRTqsAZBusakV4qAt4mIKG7Q6UO8w+XDQxavWj679kPW
 US31Q9Su/UiWPJrJmtz8gNmtUn0d38rsECHQvJ2F26QqpqCFHkbckjKQiQYGUAWdtmNw
 tFK0MPjCjKpO68WUk8YDgP9vLQcyLqss9R0kImJl5GCA4D6/rFtP7k9X7CpKZZDOT/HZ
 WAGg==
X-Gm-Message-State: AOAM531a8CBpe2mMR9iJvvR1s9k+CCTah0lx1bJ6T0izm68Mwx2RNjZ0
 0U0NqLlBaYi04D9OTG8bYBo=
X-Google-Smtp-Source: ABdhPJzABChOsNRDUCRWU+Gq8jzbKzxAgBkonx70PABubyLmysiQb+CwOj4WPPSnTZHh1di8jIFoFQ==
X-Received: by 2002:a62:aa0a:0:b029:1c2:1baa:eaea with SMTP id
 e10-20020a62aa0a0000b02901c21baaeaeamr12833472pff.52.1612114347133; 
 Sun, 31 Jan 2021 09:32:27 -0800 (PST)
Received: from localhost ([2402:3a80:11ea:e144:a2a4:c5ff:fe20:7222])
 by smtp.gmail.com with ESMTPSA id b24sm1597174pjp.12.2021.01.31.09.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 09:32:26 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
Date: Sun, 31 Jan 2021 22:58:29 +0530
Message-Id: <20210131172838.146706-9-memxor@gmail.com>
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
Subject: [greybus-dev] [PATCH 08/13] staging: rtl8188eu: Switch from strlcpy
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
ODE4OGV1L29zX2RlcC9pb2N0bF9saW51eC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL3J0
bDgxODhldS9vc19kZXAvaW9jdGxfbGludXguYyBiL2RyaXZlcnMvc3RhZ2luZy9ydGw4MTg4ZXUv
b3NfZGVwL2lvY3RsX2xpbnV4LmMKaW5kZXggNmY0MmYxM2E3Li5iZjIyZjEzMGQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvc3RhZ2luZy9ydGw4MTg4ZXUvb3NfZGVwL2lvY3RsX2xpbnV4LmMKKysrIGIv
ZHJpdmVycy9zdGFnaW5nL3J0bDgxODhldS9vc19kZXAvaW9jdGxfbGludXguYwpAQCAtMTg2NSw3
ICsxODY1LDcgQEAgc3RhdGljIGludCBydHdfd3hfc2V0X2VuY19leHQoc3RydWN0IG5ldF9kZXZp
Y2UgKmRldiwKIAkJZ290byBleGl0OwogCX0KIAotCXN0cmxjcHkoKGNoYXIgKilwYXJhbS0+dS5j
cnlwdC5hbGcsIGFsZ19uYW1lLCBJRUVFX0NSWVBUX0FMR19OQU1FX0xFTik7CisJc3Ryc2NweSgo
Y2hhciAqKXBhcmFtLT51LmNyeXB0LmFsZywgYWxnX25hbWUsIElFRUVfQ1JZUFRfQUxHX05BTUVf
TEVOKTsKIAogCWlmIChwZXh0LT5leHRfZmxhZ3MgJiBJV19FTkNPREVfRVhUX1NFVF9UWF9LRVkp
CiAJCXBhcmFtLT51LmNyeXB0LnNldF90eCA9IDE7Ci0tIAoyLjI5LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlz
dApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
