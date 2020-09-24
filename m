Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 124A9276E8E
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Sep 2020 12:21:46 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3DABB664DF
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Sep 2020 10:21:45 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2D8D566521; Thu, 24 Sep 2020 10:21:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 73C1F66529;
	Thu, 24 Sep 2020 10:21:21 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BBC9466464
 for <greybus-dev@lists.linaro.org>; Thu, 24 Sep 2020 10:21:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A8A6C66525; Thu, 24 Sep 2020 10:21:17 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by lists.linaro.org (Postfix) with ESMTPS id 49B4166464
 for <greybus-dev@lists.linaro.org>; Thu, 24 Sep 2020 10:21:01 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 7so1613488pgm.11
 for <greybus-dev@lists.linaro.org>; Thu, 24 Sep 2020 03:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UnX/s8dZ825hFV3NINASU3thAKHqLnvKzLvNJDhsTxw=;
 b=tmN5zzI7SFwbGMDZ/6WwYP9wC6G8DEtIWy1Tn1GC/7nVO0D8Xz44YT2v8ILr8RkN/1
 E/0Vq0yWVeUARVvWvpJlt4GzfEXJ1tCxepUAELPmMAOZdadgIOMLcXztIffuxV9XJTp4
 GgOR+++R2qAdQq61fPBV0iX9t4C4vLh0hDzQ2dCag+j3lX9kHKB8bbExP7mLjYAuov2V
 Gp1K5OAV5E/DAc1LFvUaa7DIF+O6HWwbN7e4Hv6N/iCA4naPmBGMv0VAXzbIYVqc8f9h
 sxWh8Lz1O01hBhOz46wRrG3roj8bJEm80DP5erkUdkGOcojwUFJIt51csXRlY/XoD2wi
 3/TA==
X-Gm-Message-State: AOAM532qQJQXhrFiVECx3EK9jIiHUEsPCEEsbTwymYmBwpUrWm9VdBlg
 rq2fQOiPMRkKxQHYxPPQDYI=
X-Google-Smtp-Source: ABdhPJxT9eCCvF0ZzSCxtrU4pmvcGxqZZRohK+ny2zGL4Vs2ipJgBjlDxeOkt33NdOvh5FEuwFwlPQ==
X-Received: by 2002:a63:2f07:: with SMTP id v7mr3297305pgv.67.1600942860497;
 Thu, 24 Sep 2020 03:21:00 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id fz23sm1922444pjb.36.2020.09.24.03.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 03:21:00 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: devel@driverdev.osuosl.org
Date: Thu, 24 Sep 2020 18:20:39 +0800
Message-Id: <20200924102039.43895-3-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200924102039.43895-1-coiby.xu@gmail.com>
References: <20200924102039.43895-1-coiby.xu@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Alex Elder <elder@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Johan Hovold <johan@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: [greybus-dev] [PATCH 3/3] [PATCH] staging: greybus: __u8 is
	sufficient for snd_ctl_elem_type_t and snd_ctl_elem_iface_t
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

VXNlIF9fOCB0byByZXBsYWNlIGludCBhbmQgcmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBfX2JpdHdp
c2UgdHlwZSBhdHRyaWJ1dGUuCgpGb3VuZCBieSBzcGFyc2UsCgokIG1ha2UgQz0yIGRyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzLwpkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5j
OjE4NToyNDogd2FybmluZzogY2FzdCB0byByZXN0cmljdGVkIHNuZF9jdGxfZWxlbV90eXBlX3QK
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYzo2Nzk6MTQ6IHdhcm5pbmc6
IHJlc3RyaWN0ZWQgc25kX2N0bF9lbGVtX2lmYWNlX3QgZGVncmFkZXMgdG8gaW50ZWdlcgpkcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jOjkwNjoxNDogd2FybmluZzogcmVz
dHJpY3RlZCBzbmRfY3RsX2VsZW1faWZhY2VfdCBkZWdyYWRlcyB0byBpbnRlZ2VyCgpTaWduZWQt
b2ZmLWJ5OiBDb2lieSBYdSA8Y29pYnkueHVAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMgfCAyICstCiBpbmNsdWRlL3VhcGkvc291bmQvYXNv
dW5kLmggICAgICAgICAgICAgIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9hdWRpb190b3BvbG9neS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xv
Z3kuYwppbmRleCA1NmJmMWE0Zjk1YWQuLmY2MDIzZmYzOTBjMiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9hdWRpb190b3BvbG9neS5jCkBAIC0xODIsNyArMTgyLDcgQEAgc3RhdGljIGludCBn
YmNvZGVjX21peGVyX2N0bF9pbmZvKHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLAogCS8q
IHVwZGF0ZSB1aW5mbyAqLwogCXVpbmZvLT5hY2Nlc3MgPSBkYXRhLT5hY2Nlc3M7CiAJdWluZm8t
PmNvdW50ID0gZGF0YS0+dmNvdW50OwotCXVpbmZvLT50eXBlID0gKHNuZF9jdGxfZWxlbV90eXBl
X3QpaW5mby0+dHlwZTsKKwl1aW5mby0+dHlwZSA9IGluZm8tPnR5cGU7CiAKIAlzd2l0Y2ggKGlu
Zm8tPnR5cGUpIHsKIAljYXNlIEdCX0FVRElPX0NUTF9FTEVNX1RZUEVfQk9PTEVBTjoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvdWFwaS9zb3VuZC9hc291bmQuaCBiL2luY2x1ZGUvdWFwaS9zb3VuZC9h
c291bmQuaAppbmRleCA1MzVhNzIyOWUxZDkuLjhlNzFhOTU2NDRhYiAxMDA2NDQKLS0tIGEvaW5j
bHVkZS91YXBpL3NvdW5kL2Fzb3VuZC5oCisrKyBiL2luY2x1ZGUvdWFwaS9zb3VuZC9hc291bmQu
aApAQCAtOTUwLDcgKzk1MCw3IEBAIHN0cnVjdCBzbmRfY3RsX2NhcmRfaW5mbyB7CiAJdW5zaWdu
ZWQgY2hhciBjb21wb25lbnRzWzEyOF07CS8qIGNhcmQgY29tcG9uZW50cyAvIGZpbmUgaWRlbnRp
ZmljYXRpb24sIGRlbGltaXRlZCB3aXRoIG9uZSBzcGFjZSAoQUM5NyBldGMuLikgKi8KIH07CiAK
LXR5cGVkZWYgaW50IF9fYml0d2lzZSBzbmRfY3RsX2VsZW1fdHlwZV90OwordHlwZWRlZiBfX3U4
IHNuZF9jdGxfZWxlbV90eXBlX3Q7CiAjZGVmaW5lCVNORFJWX0NUTF9FTEVNX1RZUEVfTk9ORQko
KF9fZm9yY2Ugc25kX2N0bF9lbGVtX3R5cGVfdCkgMCkgLyogaW52YWxpZCAqLwogI2RlZmluZQlT
TkRSVl9DVExfRUxFTV9UWVBFX0JPT0xFQU4JKChfX2ZvcmNlIHNuZF9jdGxfZWxlbV90eXBlX3Qp
IDEpIC8qIGJvb2xlYW4gdHlwZSAqLwogI2RlZmluZQlTTkRSVl9DVExfRUxFTV9UWVBFX0lOVEVH
RVIJKChfX2ZvcmNlIHNuZF9jdGxfZWxlbV90eXBlX3QpIDIpIC8qIGludGVnZXIgdHlwZSAqLwpA
QCAtOTYwLDcgKzk2MCw3IEBAIHR5cGVkZWYgaW50IF9fYml0d2lzZSBzbmRfY3RsX2VsZW1fdHlw
ZV90OwogI2RlZmluZQlTTkRSVl9DVExfRUxFTV9UWVBFX0lOVEVHRVI2NAkoKF9fZm9yY2Ugc25k
X2N0bF9lbGVtX3R5cGVfdCkgNikgLyogNjQtYml0IGludGVnZXIgdHlwZSAqLwogI2RlZmluZQlT
TkRSVl9DVExfRUxFTV9UWVBFX0xBU1QJU05EUlZfQ1RMX0VMRU1fVFlQRV9JTlRFR0VSNjQKIAot
dHlwZWRlZiBpbnQgX19iaXR3aXNlIHNuZF9jdGxfZWxlbV9pZmFjZV90OwordHlwZWRlZiBfX3U4
IHNuZF9jdGxfZWxlbV9pZmFjZV90OwogI2RlZmluZQlTTkRSVl9DVExfRUxFTV9JRkFDRV9DQVJE
CSgoX19mb3JjZSBzbmRfY3RsX2VsZW1faWZhY2VfdCkgMCkgLyogZ2xvYmFsIGNvbnRyb2wgKi8K
ICNkZWZpbmUJU05EUlZfQ1RMX0VMRU1fSUZBQ0VfSFdERVAJKChfX2ZvcmNlIHNuZF9jdGxfZWxl
bV9pZmFjZV90KSAxKSAvKiBoYXJkd2FyZSBkZXBlbmRlbnQgZGV2aWNlICovCiAjZGVmaW5lCVNO
RFJWX0NUTF9FTEVNX0lGQUNFX01JWEVSCSgoX19mb3JjZSBzbmRfY3RsX2VsZW1faWZhY2VfdCkg
MikgLyogdmlydHVhbCBtaXhlciBkZXZpY2UgKi8KLS0gCjIuMjguMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0
CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21h
aWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
