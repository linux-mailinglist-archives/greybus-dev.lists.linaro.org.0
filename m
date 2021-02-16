Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 9050E31CC7A
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 15:55:31 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AF96260896
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 14:55:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A2B686600D; Tue, 16 Feb 2021 14:55:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DB18261887;
	Tue, 16 Feb 2021 14:55:10 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 711DA60896
 for <greybus-dev@lists.linaro.org>; Tue, 16 Feb 2021 14:55:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 636896062F; Tue, 16 Feb 2021 14:55:04 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by lists.linaro.org (Postfix) with ESMTPS id BC13E6062F
 for <greybus-dev@lists.linaro.org>; Tue, 16 Feb 2021 14:55:02 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id e7so8484329ile.7
 for <greybus-dev@lists.linaro.org>; Tue, 16 Feb 2021 06:55:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0L3LUUd4CN2tocODr+9FJOieK/FWdEsnDt1BTgQNXTw=;
 b=eCLUy169sw7TRVszMzZ4bjlpdMjAi0egr7VYbEqLFjhHAHgGnIvWclYW3K9R47FHL8
 /j2PlC+8Ct2LQMe7u0dqimlXCmXuKgpfy94emRS47b/LAPqXIgj2rEo+4NmUvzUUHEJ1
 OiYiqlMNECiTU2Rgocas6jUmKZSu/C1nqZoF9ZeIyYR7sZp8HzqPpY7RC+zEBqeJKIgb
 x1M5SJy67tFcML901ndFZJFmx6H0xxivcFfdx7Nq00rYj9FAzETHEtTOf1k2sH2jVEka
 eEzsVfv4SmrqdhR4qml2yuxy2GRfL8a+qKHsri9pUHw2HfnzPXsyP23ee7bODvvAnhq4
 VcbA==
X-Gm-Message-State: AOAM530OGFRV9gYL7CClzCfOUQW0P9okD46F/UvPuRZ89gP18lDGs2NY
 LkemxPM6fL4HEJFWjL+qrTrYjw==
X-Google-Smtp-Source: ABdhPJzt5Yfzzw7DoFwQ768GJoYdE5YZWKfKbrolE9kxw0DKXKKgAyl+O5kXJCVCjLWqfVLjJfLRUQ==
X-Received: by 2002:a05:6e02:164c:: with SMTP id
 v12mr16847550ilu.49.1613487301947; 
 Tue, 16 Feb 2021 06:55:01 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id g11sm874048iom.23.2021.02.16.06.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 06:55:01 -0800 (PST)
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>, devel@driverdev.osuosl.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20210131172838.146706-1-memxor@gmail.com>
 <20210131172838.146706-3-memxor@gmail.com>
From: Alex Elder <elder@ieee.org>
Message-ID: <b565bdae-10a9-9b6c-ae60-dcee88f7dedd@ieee.org>
Date: Tue, 16 Feb 2021 08:54:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210131172838.146706-3-memxor@gmail.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
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
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [greybus-dev] [PATCH 02/13] staging: greybus: Switch from
	strlcpy to strscpy
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

T24gMS8zMS8yMSAxMToyOCBBTSwgS3VtYXIgS2FydGlrZXlhIER3aXZlZGkgd3JvdGU6Cj4gc3Ry
bGNweSBpcyBtYXJrZWQgYXMgZGVwcmVjYXRlZCBpbiBEb2N1bWVudGF0aW9uL3Byb2Nlc3MvZGVw
cmVjYXRlZC5yc3QsCj4gYW5kIHRoZXJlIGlzIG5vIGZ1bmN0aW9uYWwgZGlmZmVyZW5jZSB3aGVu
IHRoZSBjYWxsZXIgZXhwZWN0cyB0cnVuY2F0aW9uCj4gKHdoZW4gbm90IGNoZWNraW5nIHRoZSBy
ZXR1cm4gdmFsdWUpLiBzdHJzY3B5IGlzIHJlbGF0aXZlbHkgYmV0dGVyIGFzIGl0Cj4gYWxzbyBh
dm9pZHMgc2Nhbm5pbmcgdGhlIHdob2xlIHNvdXJjZSBzdHJpbmcuCj4gCj4gVGhpcyBzaWxlbmNl
cyB0aGUgcmVsYXRlZCBjaGVja3BhdGNoIHdhcm5pbmdzIGZyb206Cj4gNWRiZGIyZDg3YzI5ICgi
Y2hlY2twYXRjaDogcHJlZmVyIHN0cnNjcHkgdG8gc3RybGNweSIpCj4gCj4gU2lnbmVkLW9mZi1i
eTogS3VtYXIgS2FydGlrZXlhIER3aXZlZGkgPG1lbXhvckBnbWFpbC5jb20+CgpUaGlzIGlzIGEg
Z29vZCBjaGFuZ2UuICBCdXQgd2hpbGUgeW91J3JlIGF0IGl0LCBJIHdvdWxkCmFwcHJlY2lhdGUg
aWYgeW91IHdvdWxkIGNvbnZlcnQgYSBmZXcgc3BvdHMgdG8gdXNlCnNpemVvZihkZXN0KSByYXRo
ZXIgdGhhbiBhIGZpeGVkIGNvbnN0YW50LiAgSSB3aWxsCnBvaW50IHRoZW0gb3V0IGJlbG93LgoK
SWYgdGhpcyBpcyB0aGUgKm9ubHkqIHJlcXVlc3QgZm9yIGEgY2hhbmdlIG9uIHlvdXIKc2VyaWVz
LCBwbGVhc2UgdGVsbCBtZSB0aGF0IGFuZCBJIGNhbiBzaWduIG9mZiBvbgp0aGlzIHdpdGhvdXQg
eW91IGltcGxlbWVudGluZyBteSBzdWdnZXN0aW9uLiAgQnV0CmlmIHlvdSBwb3N0IGEgdmVyc2lv
biAyLCBwbGVhc2UgZG8gd2hhdCBJIGRlc2NyaWJlLgoKVGhhbmtzLgoKCQkJCQktQWxleAoKPiAt
LS0KPiAgIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jICAgfCAyICstCj4g
ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tb2R1bGUuYyAgIHwgMiArLQo+ICAgZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYyB8IDYgKysrLS0tCj4gICBkcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wb3dlcl9zdXBwbHkuYyAgIHwgMiArLQo+ICAgZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvc3BpbGliLmMgICAgICAgICB8IDQgKystLQo+ICAgNSBmaWxlcyBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgouIC4gLgoKCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX21vZHVsZS5jIGIvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvYXVkaW9fbW9kdWxlLmMKPiBpbmRleCBhMjQzZDYwZjAuLjBmOWZkYzA3NyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tb2R1bGUuYwo+ICsr
KyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX21vZHVsZS5jCj4gQEAgLTM0Miw3ICsz
NDIsNyBAQCBzdGF0aWMgaW50IGdiX2F1ZGlvX3Byb2JlKHN0cnVjdCBnYl9idW5kbGUgKmJ1bmRs
ZSwKPiAgIAkvKiBpbmZvcm0gYWJvdmUgbGF5ZXIgZm9yIHVldmVudCAqLwo+ICAgCWRldl9kYmco
ZGV2LCAiSW5mb3JtIHNldF9ldmVudDolZCB0byBhYm92ZSBsYXllclxuIiwgMSk7Cj4gICAJLyog
cHJlcGFyZSBmb3IgdGhlIGF1ZGlvIG1hbmFnZXIgKi8KPiAtCXN0cmxjcHkoZGVzYy5uYW1lLCBn
Ym1vZHVsZS0+bmFtZSwgR0JfQVVESU9fTUFOQUdFUl9NT0RVTEVfTkFNRV9MRU4pOwo+ICsJc3Ry
c2NweShkZXNjLm5hbWUsIGdibW9kdWxlLT5uYW1lLCBHQl9BVURJT19NQU5BR0VSX01PRFVMRV9O
QU1FX0xFTik7CgpQbGVhc2UgdXNlIHRoaXMgaGVyZSBpbnN0ZWFkOgoKCXN0cnNjcHkoZGVzYy5u
YW1lLCBnYm1vZHVsZS0+bmFtZSwgc2l6ZW9mKGRlc2MubmFtZSkpOwoKPiAgIAlkZXNjLnZpZCA9
IDI7IC8qIHRvZG8gKi8KPiAgIAlkZXNjLnBpZCA9IDM7IC8qIHRvZG8gKi8KPiAgIAlkZXNjLmlu
dGZfaWQgPSBnYm1vZHVsZS0+ZGV2X2lkOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9hdWRpb190b3BvbG9neS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9f
dG9wb2xvZ3kuYwo+IGluZGV4IDY2MmUzZThiNC4uZTgxNmU0ZGI1IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMKPiArKysgYi9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jCj4gQEAgLTIwMCw3ICsyMDAsNyBAQCBzdGF0
aWMgaW50IGdiY29kZWNfbWl4ZXJfY3RsX2luZm8oc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRy
b2wsCj4gICAJCQlyZXR1cm4gLUVJTlZBTDsKPiAgIAkJbmFtZSA9IGdiYXVkaW9fbWFwX2NvbnRy
b2xpZChtb2R1bGUsIGRhdGEtPmN0bF9pZCwKPiAgIAkJCQkJICAgICB1aW5mby0+dmFsdWUuZW51
bWVyYXRlZC5pdGVtKTsKPiAtCQlzdHJsY3B5KHVpbmZvLT52YWx1ZS5lbnVtZXJhdGVkLm5hbWUs
IG5hbWUsIE5BTUVfU0laRSk7Cj4gKwkJc3Ryc2NweSh1aW5mby0+dmFsdWUuZW51bWVyYXRlZC5u
YW1lLCBuYW1lLCBOQU1FX1NJWkUpOwoKUGxlYXNlIHVzZSB0aGlzIGhlcmUgaW5zdGVhZDoKCgkJ
c3Ryc2NweSh1aW5mby0+dmFsdWUuZW51bWVyYXRlZC5uYW1lLCBuYW1lLAoJCQlzaXplb2YodWlu
Zm8tPnZhbGl1ZS5lbnVtZXJhdGVkLm5hbWUpKTsKCihJIGtub3cgTkFNRV9TSVpFIGlzIHVzZWQg
dGhyb3VnaG91dCB0aGlzIGZpbGUsIGFuZApjb3VsZCBhbHNvIGJlIGNvbnZlcnRlZCBpbiB0aGlz
IHdheSwgYnV0IHdlIGNhbiBzYXZlCnRoYXQgZm9yIGFub3RoZXIgcGF0Y2guKQoKPiAgIAkJYnJl
YWs7Cj4gICAJZGVmYXVsdDoKPiAgIAkJZGV2X2Vycihjb21wLT5kZXYsICJJbnZhbGlkIHR5cGU6
ICVkIGZvciAlczprY29udHJvbFxuIiwKPiBAQCAtMTA0Nyw3ICsxMDQ3LDcgQEAgc3RhdGljIGlu
dCBnYmF1ZGlvX3RwbGdfY3JlYXRlX3dpZGdldChzdHJ1Y3QgZ2JhdWRpb19tb2R1bGVfaW5mbyAq
bW9kdWxlLAo+ICAgCX0KPiAgIAo+ICAgCS8qIFByZWZpeCBkZXZfaWQgdG8gd2lkZ2V0IGNvbnRy
b2xfbmFtZSAqLwo+IC0Jc3RybGNweSh0ZW1wX25hbWUsIHctPm5hbWUsIE5BTUVfU0laRSk7Cj4g
KwlzdHJzY3B5KHRlbXBfbmFtZSwgdy0+bmFtZSwgTkFNRV9TSVpFKTsKClBsZWFzZSB1c2UgdGhp
cyBoZXJlIGluc3RlYWQ6CgoJc3Ryc2NweSh0ZW1wX25hbWUsIHctPm5hbWUsIHNpemVvZih0ZW1w
X25hbWUpKTsKCj4gICAJc25wcmludGYody0+bmFtZSwgTkFNRV9TSVpFLCAiR0IgJWQgJXMiLCBt
b2R1bGUtPmRldl9pZCwgdGVtcF9uYW1lKTsKPiAgIAo+ICAgCXN3aXRjaCAody0+dHlwZSkgewo+
IEBAIC0xMTY5LDcgKzExNjksNyBAQCBzdGF0aWMgaW50IGdiYXVkaW9fdHBsZ19wcm9jZXNzX2tj
b250cm9scyhzdHJ1Y3QgZ2JhdWRpb19tb2R1bGVfaW5mbyAqbW9kdWxlLAo+ICAgCQl9Cj4gICAJ
CWNvbnRyb2wtPmlkID0gY3Vyci0+aWQ7Cj4gICAJCS8qIFByZWZpeCBkZXZfaWQgdG8gd2lkZ2V0
X25hbWUgKi8KPiAtCQlzdHJsY3B5KHRlbXBfbmFtZSwgY3Vyci0+bmFtZSwgTkFNRV9TSVpFKTsK
PiArCQlzdHJzY3B5KHRlbXBfbmFtZSwgY3Vyci0+bmFtZSwgTkFNRV9TSVpFKTsKCgpQbGVhc2Ug
dXNlIHRoaXMgaGVyZSBpbnN0ZWFkOgoKCQlzdHJzY3B5KHRlbXBfbmFtZSwgY3Vyci0+bmFtZSwg
c2l6ZW9mKHRlbXBfbmFtZSkpOwoKPiAgIAkJc25wcmludGYoY3Vyci0+bmFtZSwgTkFNRV9TSVpF
LCAiR0IgJWQgJXMiLCBtb2R1bGUtPmRldl9pZCwKPiAgIAkJCSB0ZW1wX25hbWUpOwo+ICAgCQlj
b250cm9sLT5uYW1lID0gY3Vyci0+bmFtZTsKCi4gLiAuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVz
LWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2dyZXlidXMtZGV2Cg==
