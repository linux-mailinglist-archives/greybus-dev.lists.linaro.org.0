Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 0608B278A7D
	for <lists+greybus-dev@lfdr.de>; Fri, 25 Sep 2020 16:11:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 179F266583
	for <lists+greybus-dev@lfdr.de>; Fri, 25 Sep 2020 14:11:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 03DB466529; Fri, 25 Sep 2020 14:11:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D471366521;
	Fri, 25 Sep 2020 14:11:40 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A8215616DC
 for <greybus-dev@lists.linaro.org>; Fri, 25 Sep 2020 14:11:38 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9A52766519; Fri, 25 Sep 2020 14:11:38 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by lists.linaro.org (Postfix) with ESMTPS id 8142A616DC
 for <greybus-dev@lists.linaro.org>; Fri, 25 Sep 2020 14:11:37 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id q4so1904298pjh.5
 for <greybus-dev@lists.linaro.org>; Fri, 25 Sep 2020 07:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q08aEOVeEFIcbOVub2p7BVSdpIEBfXqJPk66Kzol7Ek=;
 b=cBK7J6ZLfvKF2MF7sKfytGFCBYoZPWzsy8MSs7VRO1yfAkm/gKVJXgMlkimnCQpZDn
 kLhE2L0O9uFeKB5oGmQHfS8DMbhmqTokjHjD8es4q4gEhBKFp3M7Xvhqs7tmfD97CK0b
 9om0wPEvd49cugZ3GKUplbdrJaQ+reUqlBHv5EdkUjRyb78YZH2DnL+k/R+awuT5olvT
 5ypkzQSnP6npFVbdHUYOZXdGMFgtPOxqJv/eqssfCBcQSLHB5PGJozI+bN/0R/s/pJDK
 KVGhdH+wsPZullu3+AHE89iRLMT7pDQFfMfmXCLJodlZge27woSqN1X+PS70a4l1OvQk
 HrKQ==
X-Gm-Message-State: AOAM53258gVPvBQu4tjdjvywLbcDxmGEQ6X07IqK8lg8vG8LjpmmHFYi
 rTyYPh8uNmcrG9D7X0n/Zmc=
X-Google-Smtp-Source: ABdhPJzT6sXqjKAB73bAq8KZRHwwr+CQap8YXV/cCKxktgj12xrTfbNkL1PGBRW3RyMRygsVwxd83g==
X-Received: by 2002:a17:90a:8d05:: with SMTP id
 c5mr490557pjo.222.1601043096640; 
 Fri, 25 Sep 2020 07:11:36 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id 1sm2508194pgm.4.2020.09.25.07.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 07:11:36 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Fri, 25 Sep 2020 22:11:25 +0800
To: David Laight <David.Laight@aculab.com>
Message-ID: <20200925141125.vfm5sjnsfvxo2ras@Rk>
References: <20200924102039.43895-1-coiby.xu@gmail.com>
 <20200924102039.43895-3-coiby.xu@gmail.com>
 <0175c477851243baa8a92177667d6312@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0175c477851243baa8a92177667d6312@AcuMS.aculab.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Alex Elder <elder@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Johan Hovold <johan@kernel.org>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [greybus-dev] [PATCH 3/3] [PATCH] staging: greybus: __u8 is
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gVGh1LCBTZXAgMjQsIDIwMjAgYXQgMTA6NTQ6NTBBTSArMDAwMCwgRGF2aWQgTGFpZ2h0IHdy
b3RlOgo+RnJvbTogQ29pYnkgWHUKPj4gU2VudDogMjQgU2VwdGVtYmVyIDIwMjAgMTE6MjEKPj4g
VXNlIF9fOCB0byByZXBsYWNlIGludCBhbmQgcmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBfX2JpdHdp
c2UgdHlwZSBhdHRyaWJ1dGUuCj4+Cj4+IEZvdW5kIGJ5IHNwYXJzZSwKPi4uLgo+PiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS91YXBpL3NvdW5kL2Fzb3VuZC5oIGIvaW5jbHVkZS91YXBpL3NvdW5kL2Fz
b3VuZC5oCj4+IGluZGV4IDUzNWE3MjI5ZTFkOS4uOGU3MWE5NTY0NGFiIDEwMDY0NAo+PiAtLS0g
YS9pbmNsdWRlL3VhcGkvc291bmQvYXNvdW5kLmgKPj4gKysrIGIvaW5jbHVkZS91YXBpL3NvdW5k
L2Fzb3VuZC5oCj4+IEBAIC05NTAsNyArOTUwLDcgQEAgc3RydWN0IHNuZF9jdGxfY2FyZF9pbmZv
IHsKPj4gIAl1bnNpZ25lZCBjaGFyIGNvbXBvbmVudHNbMTI4XTsJLyogY2FyZCBjb21wb25lbnRz
IC8gZmluZSBpZGVudGlmaWNhdGlvbiwgZGVsaW1pdGVkIHdpdGggb25lCj4+IHNwYWNlIChBQzk3
IGV0Yy4uKSAqLwo+PiAgfTsKPj4KPj4gLXR5cGVkZWYgaW50IF9fYml0d2lzZSBzbmRfY3RsX2Vs
ZW1fdHlwZV90Owo+PiArdHlwZWRlZiBfX3U4IHNuZF9jdGxfZWxlbV90eXBlX3Q7Cj4+ICAjZGVm
aW5lCVNORFJWX0NUTF9FTEVNX1RZUEVfTk9ORQkoKF9fZm9yY2Ugc25kX2N0bF9lbGVtX3R5cGVf
dCkgMCkgLyogaW52YWxpZCAqLwo+PiAgI2RlZmluZQlTTkRSVl9DVExfRUxFTV9UWVBFX0JPT0xF
QU4JKChfX2ZvcmNlIHNuZF9jdGxfZWxlbV90eXBlX3QpIDEpIC8qIGJvb2xlYW4gdHlwZSAqLwo+
PiAgI2RlZmluZQlTTkRSVl9DVExfRUxFTV9UWVBFX0lOVEVHRVIJKChfX2ZvcmNlIHNuZF9jdGxf
ZWxlbV90eXBlX3QpIDIpIC8qIGludGVnZXIgdHlwZSAqLwo+Cj5XVEYgaXMgYWxsIHRoYXQgYWJv
dXQgYW55d2F5Pz8KPldoYXQgaXMgd3Jvbmcgd2l0aDoKPiNkZWZpbmUJU05EUlZfQ1RMX0VMRU1f
VFlQRV9OT05FCTB1IC8qIGludmFsaWQgKi8KCkknbSBzb3JyeSBJIGRvbid0IHF1aXRlIHVuZGVy
c3RhbmQgeW91LiBBcmUgeW91IHN1Z2dlc3RpbmcgU05EUlZfQ1RMX0VMRU1fVFlQRV9OT05FCmlz
bid0IG5lZWRlZCBpbiB0aGUgZmlyc3QgcGxhY2U/Cj4KPglEYXZpZAo+Cj4tCj5SZWdpc3RlcmVk
IEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5l
cywgTUsxIDFQVCwgVUsKPlJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpCj4KCi0tCkJl
c3QgcmVnYXJkcywKQ29pYnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFy
by5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1k
ZXYK
