Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4894B276E8D
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Sep 2020 12:21:34 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6B42E664DF
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Sep 2020 10:21:33 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5CC9166519; Thu, 24 Sep 2020 10:21:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5B72766521;
	Thu, 24 Sep 2020 10:21:20 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6C811664DF
 for <greybus-dev@lists.linaro.org>; Thu, 24 Sep 2020 10:21:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 60D8E66525; Thu, 24 Sep 2020 10:21:17 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by lists.linaro.org (Postfix) with ESMTPS id D74F166524
 for <greybus-dev@lists.linaro.org>; Thu, 24 Sep 2020 10:20:56 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id u24so1648959pgi.1
 for <greybus-dev@lists.linaro.org>; Thu, 24 Sep 2020 03:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zm8OOlfP7iSN8Z5QEpTuGr8Ee4ut7XyUwrYhe0zYYtU=;
 b=Z0NG1JGeOXMhUoUZtEeWpLWJAwfXU1LnM3n9aQYPV1EqD4HTgli0fwv6Lhdlv7jlKv
 Z+OOxKklaHsQJEl1DXGy8+Vw4Vwg5AeWJt2xqxu2VGA7PCsrUkWLmqugfP5LLh86qHGL
 2qkn/VoCg6DugV65cdy78Nb+H4VOnqlY0SyJlTPArX2C++nm5ydT8ebBq/na5B4dwaHE
 JzAghi+/xsIyNzsuJioa1W5zhmTJzi08K12iZyxzc5Gph5QuJYKas0wcUbUWFNG50IYj
 WwNGvqcol2TyQYlcdboJK23MIvPnnNIu0TsnKMmuZQ5egx0TDYmlP8NjbUseVvvGtR/T
 1/UA==
X-Gm-Message-State: AOAM5303mS8pPu8LrdCz/WUAb6qqcpF8y74c9GhJ8wn6owSob95UCxGY
 YWD5LAqr5NYEEYfyDqjgOL0=
X-Google-Smtp-Source: ABdhPJy0R9nsCIkgy+cT/BvPRyn00F2XAD27I58X5YB7kjJ7M5zzUhxgSoiCipTGlvIRf2jylwyqNg==
X-Received: by 2002:aa7:81d5:0:b029:142:2501:39fa with SMTP id
 c21-20020aa781d50000b0290142250139famr3950860pfn.73.1600942856051; 
 Thu, 24 Sep 2020 03:20:56 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id b2sm2505030pfp.3.2020.09.24.03.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 03:20:55 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: devel@driverdev.osuosl.org
Date: Thu, 24 Sep 2020 18:20:38 +0800
Message-Id: <20200924102039.43895-2-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200924102039.43895-1-coiby.xu@gmail.com>
References: <20200924102039.43895-1-coiby.xu@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: [greybus-dev] [PATCH 2/3] staging: greybus: codecs: use
	SNDRV_PCM_FMTBIT_S16_LE for format bitmask
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

c25kX3NvY19wY21fc3RyZWFtLmZvcm1hdHMgc2hvdWxkIHVzZSB0aGUgYml0bWFzayBTTkRSVl9Q
Q01fRk1UQklUXyoKaW5zdGVhZCBvZiB0aGUgc2VxdWVudGlhbCBpbnRlZ2VycyBTTkRSVl9QQ01f
Rk9STUFUXyogYXMgZXhwbGFpbmVkIGJ5CmNvbW1pdCBlNzEyYmZjYTFhYzFmNjNmNjIyZjg3YzJm
MzNiNTc2MDhmMmE0ZDE5CigiQVNvQzogY29kZWNzOiB1c2UgU05EUlZfUENNX0ZNVEJJVF8qIGZv
ciBmb3JtYXQgYml0bWFzayIpLgoKRm91bmQgYnkgc3BhcnNlLAoKJCBtYWtlIEM9MiBkcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy8KZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYzo2
OTE6MzY6IHdhcm5pbmc6IGluY29ycmVjdCB0eXBlIGluIGluaXRpYWxpemVyIChkaWZmZXJlbnQg
YmFzZSB0eXBlcykKZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYzo2OTE6MzY6
ICAgIGV4cGVjdGVkIHVuc2lnbmVkIGxvbmcgbG9uZyBbdXNlcnR5cGVdIGZvcm1hdHMKZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYzo2OTE6MzY6ICAgIGdvdCByZXN0cmljdGVk
IHNuZF9wY21fZm9ybWF0X3QgW3VzZXJ0eXBlXQpkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRp
b19jb2RlYy5jOjcwMTozNjogd2FybmluZzogaW5jb3JyZWN0IHR5cGUgaW4gaW5pdGlhbGl6ZXIg
KGRpZmZlcmVudCBiYXNlIHR5cGVzKQpkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19jb2Rl
Yy5jOjcwMTozNjogICAgZXhwZWN0ZWQgdW5zaWduZWQgbG9uZyBsb25nIFt1c2VydHlwZV0gZm9y
bWF0cwpkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5jOjcwMTozNjogICAgZ290
IHJlc3RyaWN0ZWQgc25kX3BjbV9mb3JtYXRfdCBbdXNlcnR5cGVdCgpTaWduZWQtb2ZmLWJ5OiBD
b2lieSBYdSA8Y29pYnkueHVAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2F1ZGlvX2NvZGVjLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVk
aW9fY29kZWMuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMKaW5kZXgg
NzQ1MzhmOGM1ZmE0Li40OTRhYTgyM2U5OTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2F1ZGlvX2NvZGVjLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9f
Y29kZWMuYwpAQCAtNjg4LDcgKzY4OCw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19kYWlfZHJp
dmVyIGdiYXVkaW9fZGFpW10gPSB7CiAJCS5wbGF5YmFjayA9IHsKIAkJCS5zdHJlYW1fbmFtZSA9
ICJJMlMgMCBQbGF5YmFjayIsCiAJCQkucmF0ZXMgPSBTTkRSVl9QQ01fUkFURV80ODAwMCwKLQkJ
CS5mb3JtYXRzID0gU05EUlZfUENNX0ZPUk1BVF9TMTZfTEUsCisJCQkuZm9ybWF0cyA9IFNORFJW
X1BDTV9GTVRCSVRfUzE2X0xFLAogCQkJLnJhdGVfbWF4ID0gNDgwMDAsCiAJCQkucmF0ZV9taW4g
PSA0ODAwMCwKIAkJCS5jaGFubmVsc19taW4gPSAxLApAQCAtNjk4LDcgKzY5OCw3IEBAIHN0YXRp
YyBzdHJ1Y3Qgc25kX3NvY19kYWlfZHJpdmVyIGdiYXVkaW9fZGFpW10gPSB7CiAJCS5jYXB0dXJl
ID0gewogCQkJLnN0cmVhbV9uYW1lID0gIkkyUyAwIENhcHR1cmUiLAogCQkJLnJhdGVzID0gU05E
UlZfUENNX1JBVEVfNDgwMDAsCi0JCQkuZm9ybWF0cyA9IFNORFJWX1BDTV9GT1JNQVRfUzE2X0xF
LAorCQkJLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1MxNl9MRSwKIAkJCS5yYXRlX21heCA9
IDQ4MDAwLAogCQkJLnJhdGVfbWluID0gNDgwMDAsCiAJCQkuY2hhbm5lbHNfbWluID0gMSwKLS0g
CjIuMjguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Z3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0
cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
