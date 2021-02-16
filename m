Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D604B31CD2C
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 16:49:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1254D60FF9
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 15:49:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 02B536186A; Tue, 16 Feb 2021 15:49:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4EDEA61887;
	Tue, 16 Feb 2021 15:49:39 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C690260C36
 for <greybus-dev@lists.linaro.org>; Tue, 16 Feb 2021 15:49:36 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id B55EA6186A; Tue, 16 Feb 2021 15:49:36 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by lists.linaro.org (Postfix) with ESMTPS id CF22260C36
 for <greybus-dev@lists.linaro.org>; Tue, 16 Feb 2021 15:49:35 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id s24so10607667iob.6
 for <greybus-dev@lists.linaro.org>; Tue, 16 Feb 2021 07:49:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y7FAAueIFMAXFTE9aqqwaVuxVLzWJ41n1RibstBf/uw=;
 b=QxIc+PmqkTRtWsjkPM7ntJeAO6yIDV7gswJZY16N/5NOS4oLoTvoKUEFZOAPd0v5OK
 n7+WVs/gLmpDfRAOYI3n3Wb04Lu3btEw86o30J8i6VCDOFgmO3Cvtw8O1iqNrUP4Gg2r
 70Q7pSDZ+m11qpyhR+8Pv9F67fBTTGU07/uY79NIIuE6bVdv1nKZmzPS2SQyzlhIHY0G
 fW//TYvjJyjmQuKiXk/NTLv+ErA1ZetTQy4foTWjMy1iokDYn4fs/PA8MATC9S9q4Odk
 4FLkY9vDbg+DTXmUkFcyd4UEe2UIQDrhQHVMFJSAR5qXKFIZelmpY8xbE9BVtPHtGEGM
 NBxQ==
X-Gm-Message-State: AOAM531sr7KHjJ96clF/xgCeONTcBCSDKzOeZlJ28xqhX4y9SmU/MgH6
 KaQp8wnWQZWgMI9xrFgjnAppvg==
X-Google-Smtp-Source: ABdhPJwUZNvwU49wt0M7ae6klwO05ufg/idd6YcypAKodnZIVmawBJoecT36s9t00oRUiMz2HIYfrw==
X-Received: by 2002:a5e:a911:: with SMTP id c17mr17526518iod.20.1613490575345; 
 Tue, 16 Feb 2021 07:49:35 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id i20sm10877449ila.82.2021.02.16.07.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 07:49:34 -0800 (PST)
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
References: <20210131172838.146706-1-memxor@gmail.com>
 <20210131172838.146706-3-memxor@gmail.com>
 <b565bdae-10a9-9b6c-ae60-dcee88f7dedd@ieee.org>
 <20210216154800.jg24ahfj52t6qgbd@apollo>
From: Alex Elder <elder@ieee.org>
Message-ID: <8b51d270-5d25-919d-2034-8452513e3eaf@ieee.org>
Date: Tue, 16 Feb 2021 09:49:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210216154800.jg24ahfj52t6qgbd@apollo>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linux-fbdev@vger.kernel.org, Jon Nettleton <jon.nettleton@gmail.com>,
 Marc Dietrich <marvin24@gmx.de>, Ioana Ciornei <ioana.ciornei@nxp.com>,
 Thomas Gleixner <tglx@linutronix.de>, ac100@lists.launchpad.net,
 devel@driverdev.osuosl.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Florian Fainelli <f.fainelli@gmail.com>, Daniel Drake <dsd@laptop.org>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>,
 Jens Frederich <jfrederich@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Robert Richter <rric@kernel.org>, Johan Hovold <johan@kernel.org>,
 Ian Abbott <abbotti@mev.co.uk>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-tegra@vger.kernel.org, William Cohen <wcohen@redhat.com>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Alex Elder <elder@kernel.org>, Teddy Wang <teddy.wang@siliconmotion.com>,
 greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
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

T24gMi8xNi8yMSA5OjQ4IEFNLCBLdW1hciBLYXJ0aWtleWEgRHdpdmVkaSB3cm90ZToKPiBPbiBU
dWUsIEZlYiAxNiwgMjAyMSBhdCAwODoyNDo1OVBNIElTVCwgQWxleCBFbGRlciB3cm90ZToKPj4g
VGhpcyBpcyBhIGdvb2QgY2hhbmdlLiAgQnV0IHdoaWxlIHlvdSdyZSBhdCBpdCwgSSB3b3VsZAo+
PiBhcHByZWNpYXRlIGlmIHlvdSB3b3VsZCBjb252ZXJ0IGEgZmV3IHNwb3RzIHRvIHVzZQo+PiBz
aXplb2YoZGVzdCkgcmF0aGVyIHRoYW4gYSBmaXhlZCBjb25zdGFudC4gIEkgd2lsbAo+PiBwb2lu
dCB0aGVtIG91dCBiZWxvdy4KPj4KPj4gSWYgdGhpcyBpcyB0aGUgKm9ubHkqIHJlcXVlc3QgZm9y
IGEgY2hhbmdlIG9uIHlvdXIKPj4gc2VyaWVzLCBwbGVhc2UgdGVsbCBtZSB0aGF0IGFuZCBJIGNh
biBzaWduIG9mZiBvbgo+IAo+IFNvIGZhciwgdGhpcyBoYXMgYmVlbiB0aGUgb25seSByZXF1ZXN0
Lgo+IAo+PiB0aGlzIHdpdGhvdXQgeW91IGltcGxlbWVudGluZyBteSBzdWdnZXN0aW9uLiAgQnV0
Cj4+IGlmIHlvdSBwb3N0IGEgdmVyc2lvbiAyLCBwbGVhc2UgZG8gd2hhdCBJIGRlc2NyaWJlLgo+
Pgo+IAo+IEkgd2lsbCBpbmNvcnBvcmF0ZSB0aGVzZSBpZiBJIGVuZCB1cCBzZW5kaW5nIGEgdjIu
Cj4gCj4gQWx0ZXJuYXRpdmVseSwgd291bGQgYSBzZXBhcmF0ZSBwYXRjaCB3aXRoIHlvdXIgc3Vn
Z2VzdGlvbnMgYXBwbGllZCBvbiB0b3Agb2YKPiB0aGlzIGJlIGFjY2VwdGFibGUsIGlmIEkgZG9u
J3Q/CgpZZXMuICBBc3N1bWluZyB5b3UgZG8gdGhhdCwgZm9yIHRoaXMgcGF0Y2ggKGFzLWlzKToK
ClJldmlld2VkLWJ5OiBBbGV4IEVsZGVyIDxlbGRlckBsaW5hcm8ub3JnPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBs
aXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3Jn
L21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
