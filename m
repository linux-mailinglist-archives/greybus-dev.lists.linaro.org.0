Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0841F5A86
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2020 19:31:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 44C3E61963
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2020 17:31:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 363CF65F72; Wed, 10 Jun 2020 17:31:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6E88F664E3;
	Wed, 10 Jun 2020 17:31:01 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C11AA65F72
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 17:30:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id AAC5565F7D; Wed, 10 Jun 2020 17:30:42 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by lists.linaro.org (Postfix) with ESMTPS id B6344664F0
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 17:30:09 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id s88so1159443pjb.5
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 10:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YSSqAri9IDFCpU3JjO79asbzoYTG2dNk47iwG0514GI=;
 b=chbZC5x996I6hpS0bBEMYVtB2yY95cO8r/Ke5fxA+FRWmwmLUTc6DsZapxPTvJ1mDT
 DQYpaRk+U52rzdbaPIVzg+Zd+yHzmEXQ1mIYO7eHeIHIyeUJGSSdaZmTr3Mpdw+OCQ0e
 EBBT7QQo44DvYma3hYfJbA2cRyxOnEwihO87zVPG7j8kyBNvPB8/Dc8O7aO53nKAnbD4
 sgttMffTTP6e9rzapFrVuABqmM9fc9vNg+8bNT/UT1ftPV+l2jriifgB2FfqwhtM9qQ+
 8EhdeGMXfcCZscFk6Aa8xa+THRfTsGZxHgUXD72OVWnWumxHiRjHVKopYFSWLFBAE57C
 sEaA==
X-Gm-Message-State: AOAM5326CNbPcaeaVfegEPHuoyj8RvPfHo1YW6gyU5oYBvYJkN74x/gZ
 2FzLQS5Og9S0EmU6k+B55ew=
X-Google-Smtp-Source: ABdhPJzNlj5nhn4pYpEdkNQnoV/L+9+GNHKM52nJxU7AlwWynfm7U5MIiTie1V5Kla8isU83IdExAQ==
X-Received: by 2002:a17:902:7b92:: with SMTP id
 w18mr3704408pll.273.1591810208856; 
 Wed, 10 Jun 2020 10:30:08 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.54.40])
 by smtp.googlemail.com with ESMTPSA id l83sm490470pfd.150.2020.06.10.10.29.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2020 10:30:08 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Date: Wed, 10 Jun 2020 22:58:30 +0530
Message-Id: <54b188a59687a915f43085db7b5cf05476308cbd.1591802243.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591802243.git.vaibhav.sr@gmail.com>
References: <cover.1591802243.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH v2 6/6] staging: greybus: audio: Enable GB
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
PHZhaWJoYXYuc3JAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL0tjb25m
aWcgIHwgMTQgKysrKysrKysrKysrKy0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL01ha2VmaWxl
IHwgIDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL0tjb25maWcgYi9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9LY29uZmlnCmluZGV4IGQ0Nzc3ZjVhOGI5MC4uY2JjZmNiYmEy
MzliIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9LY29uZmlnCisrKyBiL2Ry
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL0tjb25maWcKQEAgLTMsNyArMyw3IEBAIGlmIEdSRVlCVVMK
IAogY29uZmlnIEdSRVlCVVNfQVVESU8KIAl0cmlzdGF0ZSAiR3JleWJ1cyBBdWRpbyBDbGFzcyBk
cml2ZXIiCi0JZGVwZW5kcyBvbiBTT1VORAorCWRlcGVuZHMgb24gU09VTkQgJiYgU05EX1NPQwog
CS0tLWhlbHAtLS0KIAkgIFNlbGVjdCB0aGlzIG9wdGlvbiBpZiB5b3UgaGF2ZSBhIGRldmljZSB0
aGF0IGZvbGxvd3MgdGhlCiAJICBHcmV5YnVzIEF1ZGlvIENsYXNzIHNwZWNpZmljYXRpb24uCkBA
IC0xMSw2ICsxMSwxOCBAQCBjb25maWcgR1JFWUJVU19BVURJTwogCSAgVG8gY29tcGlsZSB0aGlz
IGNvZGUgYXMgYSBtb2R1bGUsIGNob3NlIE0gaGVyZTogdGhlIG1vZHVsZQogCSAgd2lsbCBiZSBj
YWxsZWQgZ2ItYXVkaW8ua28KIAorY29uZmlnIEdSRVlCVVNfQVVESU9fQVBCX0NPREVDCisJdHJp
c3RhdGUgIkdyZXlidXMgQVBCcmlkZ2UgQXVkaW8gY29kZWMgZHJpdmVyIgorCWRlcGVuZHMgb24g
U05EX1NPQyAmJiBHUkVZQlVTX0FVRElPCisJaGVscAorCSAgU2VsZWN0IHRoaXMgb3B0aW9uIGlm
IHlvdSBoYXZlIGEgVG9zaGliYSBBUEIgZGV2aWNlIHRoYXQgaGFzIEkyUworICAgICAgICAgIHBv
cnRzIGFuZCBhY3RzIGFzIGEgR3JleWJ1cyAiRHVtbXkgY29kZWMiLiBUaGlzIGRldmljZSBpcyBh
CisgICAgICAgICAgYnJpZGdlIGZyb20gYW4gQVBCLUkyUyBwb3J0IHRvIGEgVW5pcHJvIG5ldHdv
cmsuCisKKwkgIFRvIGNvbXBpbGUgdGhpcyBjb2RlIGFzIGEgbW9kdWxlLCBjaG9zZSBNIGhlcmU6
IHRoZSBtb2R1bGUKKwkgIHdpbGwgYmUgY2FsbGVkIGdiLWF1ZGlvLWNvZGVjLmtvCisKKwogY29u
ZmlnIEdSRVlCVVNfQk9PVFJPTQogCXRyaXN0YXRlICJHcmV5YnVzIEJvb3Ryb20gQ2xhc3MgZHJp
dmVyIgogCS0tLWhlbHAtLS0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL01h
a2VmaWxlIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvTWFrZWZpbGUKaW5kZXggM2I0YjZjYWJm
ZjE5Li43YzVlODk2MjIzMzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL01h
a2VmaWxlCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL01ha2VmaWxlCkBAIC00MCw4ICs0
MCw4IEBAIGdiLWF1ZGlvLW1hbmFnZXIteQk6PSBhdWRpb19tYW5hZ2VyLm8gYXVkaW9fbWFuYWdl
cl9tb2R1bGUubwogI2NjZmxhZ3MteSArPSAtREdCX0FVRElPX01BTkFHRVJfU1lTRlMKICNlbmRp
ZgogCi1vYmotJChDT05GSUdfR1JFWUJVU19BVURJT19NU004OTk0KQkrPSBnYi1hdWRpby1jb2Rl
Yy5vCi1vYmotJChDT05GSUdfR1JFWUJVU19BVURJT19NU004OTk0KQkrPSBnYi1hdWRpby1tb2R1
bGUubworb2JqLSQoQ09ORklHX0dSRVlCVVNfQVVESU9fQVBCX0NPREVDKSAgCSs9IGdiLWF1ZGlv
LWNvZGVjLm8KK29iai0kKENPTkZJR19HUkVZQlVTX0FVRElPX0FQQl9DT0RFQykJKz0gZ2ItYXVk
aW8tbW9kdWxlLm8KIG9iai0kKENPTkZJR19HUkVZQlVTX0FVRElPKQkJKz0gZ2ItYXVkaW8tZ2Iu
bwogb2JqLSQoQ09ORklHX0dSRVlCVVNfQVVESU8pCQkrPSBnYi1hdWRpby1hcGJyaWRnZWEubwog
b2JqLSQoQ09ORklHX0dSRVlCVVNfQVVESU8pCQkrPSBnYi1hdWRpby1tYW5hZ2VyLm8KLS0gCjIu
MjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3Jl
eWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6
Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
