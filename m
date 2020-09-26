Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 0039A27967A
	for <lists+greybus-dev@lfdr.de>; Sat, 26 Sep 2020 06:01:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 338B966534
	for <lists+greybus-dev@lfdr.de>; Sat, 26 Sep 2020 04:01:37 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 21758665F3; Sat, 26 Sep 2020 04:01:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 80ADF66604;
	Sat, 26 Sep 2020 04:01:23 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A926F66534
 for <greybus-dev@lists.linaro.org>; Sat, 26 Sep 2020 04:01:20 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8F03B665FA; Sat, 26 Sep 2020 04:01:20 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by lists.linaro.org (Postfix) with ESMTPS id 6A84266534
 for <greybus-dev@lists.linaro.org>; Sat, 26 Sep 2020 04:01:19 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id w7so5042180pfi.4
 for <greybus-dev@lists.linaro.org>; Fri, 25 Sep 2020 21:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TCLpBq4jyMG77GP2R933Y/gRiD3JyJMcxFQYJsXV3Gk=;
 b=h56rKen2E7OIBR4Td7I4S82XaOQOYqk1M6ws/GHMwrnctKYzUjpo+ILUbnr/AbUcVK
 V5DCsgDJW0gF4SjI4Yd/Sa+HCiQNHeV4oOLiPOS+VMIKRbEyogaC7SmCp1C78vXJTAsG
 Z7DFO6kIjEE2B6fpP6oFaD6xIyTEUvXHq+k8MWl4aJnVY7aAnUwa/7eE9CdNK6HEWmMy
 70egiRcJQylSK5xKiEhgzGoBBglY6rfkv0bEXUkgWC8jIi+HI7aphitE/33Kobe4c8Jd
 orrHVnrydehfhCKAJMsEyxPvaAfMKytsuXMVdkRtp6vwXUx9A1ptw7C6pLi8hMZ9yL7l
 vcHg==
X-Gm-Message-State: AOAM531miSNVMe0M3Kgzi/AVrKefksjVLi/qJlu2OP916lip2DGbW/HT
 wxbWB2QSSFhFQ0EpdTvkVuU=
X-Google-Smtp-Source: ABdhPJyZrrVz7fzpSvWglCTbLHQ0w97YfNqd4GdFHcJReA+jLRXGgmNHT1uIfS8ry/R1pdlYaI/cqA==
X-Received: by 2002:a63:2246:: with SMTP id t6mr1657520pgm.120.1601092878577; 
 Fri, 25 Sep 2020 21:01:18 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id y3sm3480520pgh.40.2020.09.25.21.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 21:01:17 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Sat, 26 Sep 2020 12:01:08 +0800
To: Alex Elder <elder@linaro.org>
Message-ID: <20200926040108.otqei3k74gipotk6@Rk>
References: <20200924102039.43895-1-coiby.xu@gmail.com>
 <20200924102039.43895-3-coiby.xu@gmail.com>
 <0175c477851243baa8a92177667d6312@AcuMS.aculab.com>
 <20200925141125.vfm5sjnsfvxo2ras@Rk>
 <160c222d-79e4-c5f0-344f-1a69821db039@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160c222d-79e4-c5f0-344f-1a69821db039@linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Alex Elder <elder@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Johan Hovold <johan@kernel.org>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 David Laight <David.Laight@aculab.com>, Jaroslav Kysela <perex@perex.cz>
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

T24gRnJpLCBTZXAgMjUsIDIwMjAgYXQgMTE6MDI6MjNBTSAtMDUwMCwgQWxleCBFbGRlciB3cm90
ZToKPk9uIDkvMjUvMjAgOToxMSBBTSwgQ29pYnkgWHUgd3JvdGU6Cj4+T24gVGh1LCBTZXAgMjQs
IDIwMjAgYXQgMTA6NTQ6NTBBTSArMDAwMCwgRGF2aWQgTGFpZ2h0IHdyb3RlOgo+Pj5Gcm9tOiBD
b2lieSBYdQo+Pj4+U2VudDogMjQgU2VwdGVtYmVyIDIwMjAgMTE6MjEKPj4+PlVzZSBfXzggdG8g
cmVwbGFjZSBpbnQgYW5kIHJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgX19iaXR3aXNlIHR5cGUKPj4+
PmF0dHJpYnV0ZS4KPj4+Pgo+Pj4+Rm91bmQgYnkgc3BhcnNlLAo+Pj4uLi4KPj4+PmRpZmYgLS1n
aXQgYS9pbmNsdWRlL3VhcGkvc291bmQvYXNvdW5kLmggYi9pbmNsdWRlL3VhcGkvc291bmQvYXNv
dW5kLmgKPj4+PmluZGV4IDUzNWE3MjI5ZTFkOS4uOGU3MWE5NTY0NGFiIDEwMDY0NAo+Pj4+LS0t
IGEvaW5jbHVkZS91YXBpL3NvdW5kL2Fzb3VuZC5oCj4+Pj4rKysgYi9pbmNsdWRlL3VhcGkvc291
bmQvYXNvdW5kLmgKPj4+PkBAIC05NTAsNyArOTUwLDcgQEAgc3RydWN0IHNuZF9jdGxfY2FyZF9p
bmZvIHsKPj4+PsKgwqDCoMKgIHVuc2lnbmVkIGNoYXIgY29tcG9uZW50c1sxMjhdO8KgwqDCoCAv
KiBjYXJkIGNvbXBvbmVudHMgLyBmaW5lCj4+Pj5pZGVudGlmaWNhdGlvbiwgZGVsaW1pdGVkIHdp
dGggb25lCj4+Pj5zcGFjZSAoQUM5NyBldGMuLikgKi8KPj4+PsKgfTsKPj4+Pgo+Pj4+LXR5cGVk
ZWYgaW50IF9fYml0d2lzZSBzbmRfY3RsX2VsZW1fdHlwZV90Owo+Pj4+K3R5cGVkZWYgX191OCBz
bmRfY3RsX2VsZW1fdHlwZV90Owo+Pj4+wqAjZGVmaW5lwqDCoMKgIFNORFJWX0NUTF9FTEVNX1RZ
UEVfTk9ORcKgwqDCoCAoKF9fZm9yY2UKPj4+PnNuZF9jdGxfZWxlbV90eXBlX3QpIDApIC8qIGlu
dmFsaWQgKi8KPj4+PsKgI2RlZmluZcKgwqDCoCBTTkRSVl9DVExfRUxFTV9UWVBFX0JPT0xFQU7C
oMKgwqAgKChfX2ZvcmNlCj4+Pj5zbmRfY3RsX2VsZW1fdHlwZV90KSAxKSAvKiBib29sZWFuIHR5
cGUgKi8KPj4+PsKgI2RlZmluZcKgwqDCoCBTTkRSVl9DVExfRUxFTV9UWVBFX0lOVEVHRVLCoMKg
wqAgKChfX2ZvcmNlCj4+Pj5zbmRfY3RsX2VsZW1fdHlwZV90KSAyKSAvKiBpbnRlZ2VyIHR5cGUg
Ki8KPj4+Cj4+PldURiBpcyBhbGwgdGhhdCBhYm91dCBhbnl3YXk/Pwo+Pj5XaGF0IGlzIHdyb25n
IHdpdGg6Cj4+PiNkZWZpbmXCoMKgwqAgU05EUlZfQ1RMX0VMRU1fVFlQRV9OT05FwqDCoMKgIDB1
IC8qIGludmFsaWQgKi8KPj4KPj5JJ20gc29ycnkgSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIHlv
dS4gQXJlIHlvdSBzdWdnZXN0aW5nCj4+U05EUlZfQ1RMX0VMRU1fVFlQRV9OT05FCj4+aXNuJ3Qg
bmVlZGVkIGluIHRoZSBmaXJzdCBwbGFjZT8KPgo+SSB0aGluayBEYXZpZCBpcyBhc2tpbmcgd2h5
IGl0J3MgZGVmaW5lZCB0aGUgd2F5IGl0IGlzLAo+YW5kIEknZCBndWVzcyBpdCdzIHRvIGhhdmUg
dGhlIGNvbXBpbGVyIGlzc3VlIGFuIGVycm9yCj5pZiB5b3UgYXR0ZW1wdCB0byBhc3NpZ24gb25l
IG9mIHRoZXNlIHZhbHVlcyB0byBhIHZhcmlhYmxlCj5vciBmaWVsZCBvZiB0aGUgd3JvbmcgdHlw
ZS4KPgo+Tm8sIHlvdSBzaG91bGQgbm90IGF0dGVtcHQgdG8gY2hhbmdlIHRoaXMuCgpUaGFuayB5
b3UgZm9yIHRoZSBleHBsYW5hdGlvbiEKCj4KPgkJCQkJLUFsZXgKPj4+wqDCoMKgwqBEYXZpZAo+
Pj4KPj4+LQo+Pj5SZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91
bnQgRmFybSwgTWlsdG9uCj4+PktleW5lcywgTUsxIDFQVCwgVUsKPj4+UmVnaXN0cmF0aW9uIE5v
OiAxMzk3Mzg2IChXYWxlcykKPj4+Cj4+Cj4+LS0KPj5CZXN0IHJlZ2FyZHMsCj4+Q29pYnkKPj5f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PmdyZXlidXMt
ZGV2IG1haWxpbmcgbGlzdAo+PmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKPj5odHRwczov
L2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo+CgotLQpCZXN0
IHJlZ2FyZHMsCkNvaWJ5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2
Cg==
