Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC4A2007BA
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2020 13:23:11 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4289E66597
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2020 11:23:10 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 36D2E665A1; Fri, 19 Jun 2020 11:23:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 279EF665BE;
	Fri, 19 Jun 2020 11:22:17 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 091D26659D
 for <greybus-dev@lists.linaro.org>; Fri, 19 Jun 2020 11:22:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id EF605665A5; Fri, 19 Jun 2020 11:22:04 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by lists.linaro.org (Postfix) with ESMTPS id 29C946659D
 for <greybus-dev@lists.linaro.org>; Fri, 19 Jun 2020 11:21:42 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id e9so4358398pgo.9
 for <greybus-dev@lists.linaro.org>; Fri, 19 Jun 2020 04:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pMnJVRRzK09/VbvKw7yuFnugcGkqSr1qw4/Z5xsvw+g=;
 b=sJKee3TulYOcXLF6zt9xuAQYSqx1YYu5TRv/DT2iiFBC7t6/xmqUiLvpbj0TpwxEN7
 5h0yHiT00VtbsxHCQ2amescUORGgH+erP1L/S3ysyml9AEeADA8hAKnhQ5X+5e7+LqS8
 1rZwFzSkBnyrKHAAt2fy4gGbrkurTKo/Nc5UDYctkRtFDPA9YN4AIW/Da+nvT1+8AFoh
 AI1XqWbWNzg2auLYmWXlzHjNg8jHYAPLyZ6rMKgKPH9g0D9z3mfbf2ku15A7YFwSeyQB
 T7j5oCN1lsPbdFYzn49kZ/ao4IqE5JCP0T94YxJANiEHlFvisIo3nXvI3veX3MrTUp8X
 UJPg==
X-Gm-Message-State: AOAM533knZmO0y9/Q5pEauTNkPkei6mMl8lnm0mDY4fPeEhnF7TsSi2p
 BMC7BNPtnQgm7suXHZK+zI4=
X-Google-Smtp-Source: ABdhPJxipZmj5Iz98CdyoTS3c4ColLD2W0ESzWGhlG9bBctqOh2MzBwx8a9qabDG4nUQ8N1Fdzcz8w==
X-Received: by 2002:a62:1c46:: with SMTP id c67mr7524623pfc.170.1592565701246; 
 Fri, 19 Jun 2020 04:21:41 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.55.41])
 by smtp.googlemail.com with ESMTPSA id d9sm4974293pgg.74.2020.06.19.04.21.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jun 2020 04:21:40 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>
Date: Fri, 19 Jun 2020 16:50:26 +0530
Message-Id: <e9aaa09c6688aa5ed8bddf51f5cd402bb8cf39b3.1592537217.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1592537217.git.vaibhav.sr@gmail.com>
References: <cover.1592537217.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [greybus-dev] [PATCH v3 6/6] staging: greybus: audio: Enable GB
	codec, audio module compilation.
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

Q3VycmVudGx5IHlvdSBjYW4ndCBlbmFibGUgdGhlIEdleSBCdXMgQXVkaW8gQ29kZWMgYmVjYXVz
ZSB0aGVyZSBpcyBubwplbnRyeSBmb3IgaXQgaW4gdGhlIEtjb25maWcgZmlsZS4gT3JpZ2luYWxs
eSB0aGUgY29uZmlnIG5hbWUgd2FzIGdvaW5nCnRvIGJlIEFVRElPX01TTTg5OTQgYnV0IHRoYXQn
cyBub3QgY29ycmVjdCBiZWNhdXNlIG90aGVyIHR5cGVzIG9mCmhhcmR3YXJlIGFyZSBzdXBwb3J0
ZWQgbm93LiBJIGhhdmUgY2hvc2VuIHRoZSBuYW1lIEFVRElPX0FQQl9DT0RFQwppbnN0ZWFkLiAg
QWxzbyBJIGhhZCB0byB1cGRhdGUgdGhlIGRlcGVuZGVuY2llcyBmb3IgR1JFWUJVU19BVURJTyB0
bwptYWtlIHRoZSBjb21waWxlIHdvcmsuCgpTaWduZWQtb2ZmLWJ5OiBWYWliaGF2IEFnYXJ3YWwg
PHZhaWJoYXYuc3JAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNh
cnBlbnRlckBvcmFjbGUuY29tPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL0tjb25maWcg
IHwgMTQgKysrKysrKysrKysrKy0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL01ha2VmaWxlIHwg
IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL0tjb25maWcgYi9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9LY29uZmlnCmluZGV4IDkzODllN2E5MjJmYS4uOTI3Y2ZhNGJjOTg5
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9LY29uZmlnCisrKyBiL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL0tjb25maWcKQEAgLTMsNyArMyw3IEBAIGlmIEdSRVlCVVMKIAog
Y29uZmlnIEdSRVlCVVNfQVVESU8KIAl0cmlzdGF0ZSAiR3JleWJ1cyBBdWRpbyBDbGFzcyBkcml2
ZXIiCi0JZGVwZW5kcyBvbiBTT1VORAorCWRlcGVuZHMgb24gU09VTkQgJiYgU05EX1NPQwogCWhl
bHAKIAkgIFNlbGVjdCB0aGlzIG9wdGlvbiBpZiB5b3UgaGF2ZSBhIGRldmljZSB0aGF0IGZvbGxv
d3MgdGhlCiAJICBHcmV5YnVzIEF1ZGlvIENsYXNzIHNwZWNpZmljYXRpb24uCkBAIC0xMSw2ICsx
MSwxOCBAQCBjb25maWcgR1JFWUJVU19BVURJTwogCSAgVG8gY29tcGlsZSB0aGlzIGNvZGUgYXMg
YSBtb2R1bGUsIGNob3NlIE0gaGVyZTogdGhlIG1vZHVsZQogCSAgd2lsbCBiZSBjYWxsZWQgZ2It
YXVkaW8ua28KIAorY29uZmlnIEdSRVlCVVNfQVVESU9fQVBCX0NPREVDCisJdHJpc3RhdGUgIkdy
ZXlidXMgQVBCcmlkZ2UgQXVkaW8gY29kZWMgZHJpdmVyIgorCWRlcGVuZHMgb24gU05EX1NPQyAm
JiBHUkVZQlVTX0FVRElPCisJaGVscAorCSAgU2VsZWN0IHRoaXMgb3B0aW9uIGlmIHlvdSBoYXZl
IGEgVG9zaGliYSBBUEIgZGV2aWNlIHRoYXQgaGFzIEkyUworICAgICAgICAgIHBvcnRzIGFuZCBh
Y3RzIGFzIGEgR3JleWJ1cyAiRHVtbXkgY29kZWMiLiBUaGlzIGRldmljZSBpcyBhCisgICAgICAg
ICAgYnJpZGdlIGZyb20gYW4gQVBCLUkyUyBwb3J0IHRvIGEgVW5pcHJvIG5ldHdvcmsuCisKKwkg
IFRvIGNvbXBpbGUgdGhpcyBjb2RlIGFzIGEgbW9kdWxlLCBjaG9zZSBNIGhlcmU6IHRoZSBtb2R1
bGUKKwkgIHdpbGwgYmUgY2FsbGVkIGdiLWF1ZGlvLWNvZGVjLmtvCisKKwogY29uZmlnIEdSRVlC
VVNfQk9PVFJPTQogCXRyaXN0YXRlICJHcmV5YnVzIEJvb3Ryb20gQ2xhc3MgZHJpdmVyIgogCWhl
bHAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL01ha2VmaWxlIGIvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvTWFrZWZpbGUKaW5kZXggM2I0YjZjYWJmZjE5Li43YzVlODk2MjIz
MzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL01ha2VmaWxlCisrKyBiL2Ry
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL01ha2VmaWxlCkBAIC00MCw4ICs0MCw4IEBAIGdiLWF1ZGlv
LW1hbmFnZXIteQk6PSBhdWRpb19tYW5hZ2VyLm8gYXVkaW9fbWFuYWdlcl9tb2R1bGUubwogI2Nj
ZmxhZ3MteSArPSAtREdCX0FVRElPX01BTkFHRVJfU1lTRlMKICNlbmRpZgogCi1vYmotJChDT05G
SUdfR1JFWUJVU19BVURJT19NU004OTk0KQkrPSBnYi1hdWRpby1jb2RlYy5vCi1vYmotJChDT05G
SUdfR1JFWUJVU19BVURJT19NU004OTk0KQkrPSBnYi1hdWRpby1tb2R1bGUubworb2JqLSQoQ09O
RklHX0dSRVlCVVNfQVVESU9fQVBCX0NPREVDKSAgCSs9IGdiLWF1ZGlvLWNvZGVjLm8KK29iai0k
KENPTkZJR19HUkVZQlVTX0FVRElPX0FQQl9DT0RFQykJKz0gZ2ItYXVkaW8tbW9kdWxlLm8KIG9i
ai0kKENPTkZJR19HUkVZQlVTX0FVRElPKQkJKz0gZ2ItYXVkaW8tZ2Iubwogb2JqLSQoQ09ORklH
X0dSRVlCVVNfQVVESU8pCQkrPSBnYi1hdWRpby1hcGJyaWRnZWEubwogb2JqLSQoQ09ORklHX0dS
RVlCVVNfQVVESU8pCQkrPSBnYi1hdWRpby1tYW5hZ2VyLm8KLS0gCjIuMjYuMgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGlu
ZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8u
b3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
