Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D630281F1A
	for <lists+greybus-dev@lfdr.de>; Sat,  3 Oct 2020 01:31:43 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 79F8160850
	for <lists+greybus-dev@lfdr.de>; Fri,  2 Oct 2020 23:31:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6B11D618B2; Fri,  2 Oct 2020 23:31:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E0A33618DF;
	Fri,  2 Oct 2020 23:31:15 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 07E3860850
 for <greybus-dev@lists.linaro.org>; Fri,  2 Oct 2020 23:31:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E7CC3618C5; Fri,  2 Oct 2020 23:31:08 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by lists.linaro.org (Postfix) with ESMTPS id E3B8A60850
 for <greybus-dev@lists.linaro.org>; Fri,  2 Oct 2020 23:31:06 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id gm14so1987720pjb.2
 for <greybus-dev@lists.linaro.org>; Fri, 02 Oct 2020 16:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=39rkTJtXlFtQ5/5T04uloKyyaaDBj+PUdUyBnDF91SY=;
 b=p8/kCj1HZpHcsHIIIOvlw1CvDj2VTMQq2HOIR5bBuT36ASsD4udr7PcKxp+rj1V8DX
 +VFcqend45ZPAFYAVExN77t4bouQTu29qAeK27WD5Y94i39VvmL0mWRNpDRPK82mxGiF
 8kFiCCuzM1epzXkzoDGw6Dz6TGPTUImxLyW4Q8v56vZS0bkcUyGOs01Thxg7+VmRDD65
 B7UKNgFuZfAnyPpQaqHUI9TDSVzHgrlgCyXUcTvzzekEJoREBa+lr+s7FtyU6yp8+g50
 pfjPHL/wuR1B/ISmMuxZZ666Xj4UAIGNGxMr4aZvfHPJcU1XmYRDQM/kbA0uZbuqsi84
 ZK0Q==
X-Gm-Message-State: AOAM5309T12I1CMk6RahNPWIYuqyawrfIgXobHHp7SJSrR3PiKoQo5DR
 9WwamEQ2lOr9uVpCL5LnxSY=
X-Google-Smtp-Source: ABdhPJyUtQlg/rmFNBHDPU+1oFHbUZUbywYtOW1tMUg6dD64a2blGx0obpFn2zNJ9c452DW8VA8H0Q==
X-Received: by 2002:a17:90a:6685:: with SMTP id
 m5mr5010628pjj.235.1601681465996; 
 Fri, 02 Oct 2020 16:31:05 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id 11sm2704492pja.8.2020.10.02.16.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 16:31:05 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: devel@driverdev.osuosl.org
Date: Sat,  3 Oct 2020 07:30:55 +0800
Message-Id: <20201002233057.74462-2-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201002233057.74462-1-coiby.xu@gmail.com>
References: <20201002233057.74462-1-coiby.xu@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 Alex Elder <elder@linaro.org>, open list <linux-kernel@vger.kernel.org>
Subject: [greybus-dev] [PATCH v2 2/3] staging: greybus: codecs: use
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
IHJlc3RyaWN0ZWQgc25kX3BjbV9mb3JtYXRfdCBbdXNlcnR5cGVdCgpSZXZpZXdlZC1ieTogQWxl
eCBFbGRlciA8ZWxkZXJAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogQ29pYnkgWHUgPGNvaWJ5
Lnh1QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5j
IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMgYi9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5jCmluZGV4IDc0NTM4ZjhjNWZhNC4u
NDk0YWE4MjNlOTk4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19j
b2RlYy5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMKQEAgLTY4
OCw3ICs2ODgsNyBAQCBzdGF0aWMgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlciBnYmF1ZGlvX2Rh
aVtdID0gewogCQkucGxheWJhY2sgPSB7CiAJCQkuc3RyZWFtX25hbWUgPSAiSTJTIDAgUGxheWJh
Y2siLAogCQkJLnJhdGVzID0gU05EUlZfUENNX1JBVEVfNDgwMDAsCi0JCQkuZm9ybWF0cyA9IFNO
RFJWX1BDTV9GT1JNQVRfUzE2X0xFLAorCQkJLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1Mx
Nl9MRSwKIAkJCS5yYXRlX21heCA9IDQ4MDAwLAogCQkJLnJhdGVfbWluID0gNDgwMDAsCiAJCQku
Y2hhbm5lbHNfbWluID0gMSwKQEAgLTY5OCw3ICs2OTgsNyBAQCBzdGF0aWMgc3RydWN0IHNuZF9z
b2NfZGFpX2RyaXZlciBnYmF1ZGlvX2RhaVtdID0gewogCQkuY2FwdHVyZSA9IHsKIAkJCS5zdHJl
YW1fbmFtZSA9ICJJMlMgMCBDYXB0dXJlIiwKIAkJCS5yYXRlcyA9IFNORFJWX1BDTV9SQVRFXzQ4
MDAwLAotCQkJLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk9STUFUX1MxNl9MRSwKKwkJCS5mb3JtYXRz
ID0gU05EUlZfUENNX0ZNVEJJVF9TMTZfTEUsCiAJCQkucmF0ZV9tYXggPSA0ODAwMCwKIAkJCS5y
YXRlX21pbiA9IDQ4MDAwLAogCQkJLmNoYW5uZWxzX21pbiA9IDEsCi0tIAoyLjI4LjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1h
aWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGlu
YXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
