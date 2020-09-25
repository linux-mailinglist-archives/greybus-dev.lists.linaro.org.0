Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id A85CB278D84
	for <lists+greybus-dev@lfdr.de>; Fri, 25 Sep 2020 18:02:43 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CC9E766583
	for <lists+greybus-dev@lfdr.de>; Fri, 25 Sep 2020 16:02:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id BFA7D66529; Fri, 25 Sep 2020 16:02:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 83B8266521;
	Fri, 25 Sep 2020 16:02:29 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id EB8D361820
 for <greybus-dev@lists.linaro.org>; Fri, 25 Sep 2020 16:02:26 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CE1E366519; Fri, 25 Sep 2020 16:02:26 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by lists.linaro.org (Postfix) with ESMTPS id B87E461820
 for <greybus-dev@lists.linaro.org>; Fri, 25 Sep 2020 16:02:25 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id g7so3242295iov.13
 for <greybus-dev@lists.linaro.org>; Fri, 25 Sep 2020 09:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KKM36HMFNo7IvqfCBLe5UvX13jWEuh671Vjt/sAVWGU=;
 b=d3c6G/gNJ0WCbpk6ezoJnKyREcM21jYUi7pRWbbl///vwQ/u5tNHl20HOU7JvyEYoU
 Ltc5ei7F1a4jo423QYacNYyt8lqYLNKmmPcjoaaFRcodTpBea8CpJZzMWmmhBqcRgK3Q
 +/ZIh1TfHaYcqcA8yrp6xOL3GeR86gb6JFHI8aVB8A4pQ9FUcWp+4/JtL+gC4kPyGkR8
 3PSpADpOuYm97Y8CGUsIiNvVSXkbN0bBGwzfDMsgmDjHZMreUqag2yI2tDpb4WdJxmJo
 I7umFZVpyN/jMvVrBgNQK+m2FEGBubdRo+/Q5m2ovXgA3j/+ZSHDYq71gVfANHdkM+e/
 dwgg==
X-Gm-Message-State: AOAM530frdVpDk18VRN/loOeOvNYagyAhIs+xT6MOMHteVP53mpGSqPo
 D0mJiTDEfAbFxVAm0V6G/G0wZJ/4
X-Google-Smtp-Source: ABdhPJw116LnPqm4dNs1MVsCzNLg8V45rQtN1gWgLkN5mnf5844SsTjgU2eBKcngEh17i/akpuiSGA==
X-Received: by 2002:a02:1004:: with SMTP id 4mr411804jay.127.1601049745262;
 Fri, 25 Sep 2020 09:02:25 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id c12sm1720817ili.48.2020.09.25.09.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2020 09:02:24 -0700 (PDT)
To: Coiby Xu <coiby.xu@gmail.com>, David Laight <David.Laight@aculab.com>
References: <20200924102039.43895-1-coiby.xu@gmail.com>
 <20200924102039.43895-3-coiby.xu@gmail.com>
 <0175c477851243baa8a92177667d6312@AcuMS.aculab.com>
 <20200925141125.vfm5sjnsfvxo2ras@Rk>
From: Alex Elder <elder@linaro.org>
Message-ID: <160c222d-79e4-c5f0-344f-1a69821db039@linaro.org>
Date: Fri, 25 Sep 2020 11:02:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925141125.vfm5sjnsfvxo2ras@Rk>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Alex Elder <elder@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Johan Hovold <johan@kernel.org>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 Jaroslav Kysela <perex@perex.cz>
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

T24gOS8yNS8yMCA5OjExIEFNLCBDb2lieSBYdSB3cm90ZToKPiBPbiBUaHUsIFNlcCAyNCwgMjAy
MCBhdCAxMDo1NDo1MEFNICswMDAwLCBEYXZpZCBMYWlnaHQgd3JvdGU6Cj4+IEZyb206IENvaWJ5
IFh1Cj4+PiBTZW50OiAyNCBTZXB0ZW1iZXIgMjAyMCAxMToyMQo+Pj4gVXNlIF9fOCB0byByZXBs
YWNlIGludCBhbmQgcmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBfX2JpdHdpc2UgdHlwZSAKPj4+IGF0
dHJpYnV0ZS4KPj4+Cj4+PiBGb3VuZCBieSBzcGFyc2UsCj4+IC4uLgo+Pj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvdWFwaS9zb3VuZC9hc291bmQuaCBiL2luY2x1ZGUvdWFwaS9zb3VuZC9hc291bmQu
aAo+Pj4gaW5kZXggNTM1YTcyMjllMWQ5Li44ZTcxYTk1NjQ0YWIgMTAwNjQ0Cj4+PiAtLS0gYS9p
bmNsdWRlL3VhcGkvc291bmQvYXNvdW5kLmgKPj4+ICsrKyBiL2luY2x1ZGUvdWFwaS9zb3VuZC9h
c291bmQuaAo+Pj4gQEAgLTk1MCw3ICs5NTAsNyBAQCBzdHJ1Y3Qgc25kX2N0bF9jYXJkX2luZm8g
ewo+Pj4gwqDCoMKgwqAgdW5zaWduZWQgY2hhciBjb21wb25lbnRzWzEyOF07wqDCoMKgIC8qIGNh
cmQgY29tcG9uZW50cyAvIGZpbmUgCj4+PiBpZGVudGlmaWNhdGlvbiwgZGVsaW1pdGVkIHdpdGgg
b25lCj4+PiBzcGFjZSAoQUM5NyBldGMuLikgKi8KPj4+IMKgfTsKPj4+Cj4+PiAtdHlwZWRlZiBp
bnQgX19iaXR3aXNlIHNuZF9jdGxfZWxlbV90eXBlX3Q7Cj4+PiArdHlwZWRlZiBfX3U4IHNuZF9j
dGxfZWxlbV90eXBlX3Q7Cj4+PiDCoCNkZWZpbmXCoMKgwqAgU05EUlZfQ1RMX0VMRU1fVFlQRV9O
T05FwqDCoMKgICgoX19mb3JjZSAKPj4+IHNuZF9jdGxfZWxlbV90eXBlX3QpIDApIC8qIGludmFs
aWQgKi8KPj4+IMKgI2RlZmluZcKgwqDCoCBTTkRSVl9DVExfRUxFTV9UWVBFX0JPT0xFQU7CoMKg
wqAgKChfX2ZvcmNlIAo+Pj4gc25kX2N0bF9lbGVtX3R5cGVfdCkgMSkgLyogYm9vbGVhbiB0eXBl
ICovCj4+PiDCoCNkZWZpbmXCoMKgwqAgU05EUlZfQ1RMX0VMRU1fVFlQRV9JTlRFR0VSwqDCoMKg
ICgoX19mb3JjZSAKPj4+IHNuZF9jdGxfZWxlbV90eXBlX3QpIDIpIC8qIGludGVnZXIgdHlwZSAq
Lwo+Pgo+PiBXVEYgaXMgYWxsIHRoYXQgYWJvdXQgYW55d2F5Pz8KPj4gV2hhdCBpcyB3cm9uZyB3
aXRoOgo+PiAjZGVmaW5lwqDCoMKgIFNORFJWX0NUTF9FTEVNX1RZUEVfTk9ORcKgwqDCoCAwdSAv
KiBpbnZhbGlkICovCj4gCj4gSSdtIHNvcnJ5IEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCB5b3Uu
IEFyZSB5b3Ugc3VnZ2VzdGluZyAKPiBTTkRSVl9DVExfRUxFTV9UWVBFX05PTkUKPiBpc24ndCBu
ZWVkZWQgaW4gdGhlIGZpcnN0IHBsYWNlPwoKSSB0aGluayBEYXZpZCBpcyBhc2tpbmcgd2h5IGl0
J3MgZGVmaW5lZCB0aGUgd2F5IGl0IGlzLAphbmQgSSdkIGd1ZXNzIGl0J3MgdG8gaGF2ZSB0aGUg
Y29tcGlsZXIgaXNzdWUgYW4gZXJyb3IKaWYgeW91IGF0dGVtcHQgdG8gYXNzaWduIG9uZSBvZiB0
aGVzZSB2YWx1ZXMgdG8gYSB2YXJpYWJsZQpvciBmaWVsZCBvZiB0aGUgd3JvbmcgdHlwZS4KCk5v
LCB5b3Ugc2hvdWxkIG5vdCBhdHRlbXB0IHRvIGNoYW5nZSB0aGlzLgoKCQkJCQktQWxleAo+PiDC
oMKgwqDCoERhdmlkCj4+Cj4+IC0KPj4gUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFt
bGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIAo+PiBNSzEgMVBULCBVSwo+PiBS
ZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQo+Pgo+IAo+IC0tIAo+IEJlc3QgcmVnYXJk
cywKPiBDb2lieQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0Cj4gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJv
Lm9yZwo+IGh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMt
ZGV2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5
YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczov
L2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
