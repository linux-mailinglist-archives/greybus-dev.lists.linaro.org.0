Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 6147235F63E
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Apr 2021 16:35:35 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7A51666795
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Apr 2021 14:35:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6AE2E667A3; Wed, 14 Apr 2021 14:35:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BD441667A6;
	Wed, 14 Apr 2021 14:35:20 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 45AD866795
 for <greybus-dev@lists.linaro.org>; Wed, 14 Apr 2021 14:35:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 36BF8667A6; Wed, 14 Apr 2021 14:35:18 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by lists.linaro.org (Postfix) with ESMTPS id 71F0D667A3
 for <greybus-dev@lists.linaro.org>; Wed, 14 Apr 2021 14:35:16 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id c3so11172893ils.5
 for <greybus-dev@lists.linaro.org>; Wed, 14 Apr 2021 07:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2rbXicCAr8vD+feC/9JhEPaSLkL44d68CS0R7zJKVxY=;
 b=Y2M74TWyIG5QZuOo0iLdf4EctDZe/kucoePqEYiygZbLECnCY/WXzkzD/sGoIQZiko
 /Zp5YMCyzbc1dIB1O361uasnHuaeMSXGyoZ8ue3YCPB5FudI7sqiMFKtdRrMOB3qlrf9
 yAxWh0yp/ZnzeE4PxE23BeptQKYpMGVOTs23Vj+zp23FZh9iVGNtTCWtdJEUxDooMGXJ
 biNXUHQDFgziDNaRtV6xeOwMmg6IUMqMjIMZGa1tqj3L0hD3deLy/w4k4+qlM6a+oTBZ
 D1Xls6Y4LSyLKw9uJ7arpIxdudQC/9hwxLd723UjPatHA8icaGkfT4Ioni/NJbmsCCJo
 h7rw==
X-Gm-Message-State: AOAM530k+yRj8ezj8Kmt+EGuX1/V5I2lRijDU5eGRWh5CXps0mKoO73l
 TRnBjQPSP3JIe1EhvD+pzXCQ3A==
X-Google-Smtp-Source: ABdhPJxgAKwab2DYZQHYvNRaf7til72OiIr8070gbCI5ZDj1UeVcKG4GIweVUT0I9E7hmkBo64gmkw==
X-Received: by 2002:a92:ab01:: with SMTP id v1mr29484106ilh.230.1618410915925; 
 Wed, 14 Apr 2021 07:35:15 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id o6sm8257245ioa.21.2021.04.14.07.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 07:35:15 -0700 (PDT)
To: Joe Perches <joe@perches.com>, Greg KH <gregkh@linuxfoundation.org>,
 Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
References: <20210406124259.GA96537@zhans> <YGxhrLZPIPjILWUH@kroah.com>
 <7d7be8bcc0e80d826083890ed7791070ad25e603.camel@perches.com>
 <1607b040-6bc4-9a58-ae81-4ea0adf5885d@ieee.org>
 <b22ffa716ee871f7e09ad7321213a897156edab0.camel@perches.com>
From: Alex Elder <elder@ieee.org>
Message-ID: <78c88472-9ed9-bade-407c-23bd557f19bb@ieee.org>
Date: Wed, 14 Apr 2021 09:35:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b22ffa716ee871f7e09ad7321213a897156edab0.camel@perches.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: elder@kernel.org, outreachy-kernel@googlegroups.com,
 Dwaipayan Ray <dwaipayanray1@gmail.com>, linux-staging@lists.linux.dev,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Match parentheses
	alignment
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

T24gNC8xNC8yMSA5OjI5IEFNLCBKb2UgUGVyY2hlcyB3cm90ZToKPiBPbiBXZWQsIDIwMjEtMDQt
MTQgYXQgMDg6MTcgLTA1MDAsIEFsZXggRWxkZXIgd3JvdGU6Cj4+IFBlcmhhcHMgKGxpa2UgdGhl
IC1XIG9wdGlvbnMgZm9yIEdDQykgdGhlcmUKPj4gY291bGQgYmUgYSB3YXkgdG8gc3BlY2lmeSBp
biBhIE1ha2VmaWxlIHdoaWNoIGNoZWNrcGF0Y2gKPj4gbWVzc2FnZXMgYXJlIHJlcG9ydGVkL25v
dCByZXBvcnRlZD8gIEkgZG9uJ3QgY2xhaW0gdGhhdCdzCj4+IGEgZ29vZCBzdWdnZXN0aW9uLCBi
dXQgaWYgSSBjb3VsZCBvcHRpb25hbGx5IGluZGljYXRlCj4+IHNvbWV3aGVyZSB0aGF0ICJ0d28g
Y29uc2VjdXRpdmUgYmxhbmsgbGluZXMgaXMgT0sgZm9yCj4+IEdyZXlidXMiIChvbmUgZXhhbXBs
ZSB0aGF0IGNvbWVzIHRvIG1pbmQpIEkgbWlnaHQgZG8gc28uCj4gCj4gY2hlY2twYXRjaCBhbHJl
YWR5IGhhcyAtLWlnbm9yZT08bGlzdD4gYW5kIC0tdHlwZXM9PGxpc3Q+Cj4gZm9yIHRoZSB2YXJp
b3VzIGNsYXNzZXMgb2YgbWVzc2FnZXMgaXQgZW1pdHMuCj4gCj4gc2VlOiAkIC4vc2NyaXB0cy9j
aGVja3BhdGNoLnBsIC0tbGlzdC10eXBlcyAtLXZlcmJvc2UKPiAKPiBEd2FpcGF5YW4gUmF5IChj
YydkKSBpcyBzdXBwb3NlZGx5IHdvcmtpbmcgb24gZXhwYW5kaW5nCj4gdGhlIHZlcmJvc2UgZGVz
Y3JpcHRpb25zIG9mIGVhY2ggdHlwZS4KPiAKClRoYXQncyBhd2Vzb21lLCBJIHdhc24ndCBhd2Fy
ZSBvZiB0aGF0LgoKQW55IHN1Z2dlc3Rpb25zIG9uIGEgc3RhbmRhcmRpemVkIHdheSB0byBzYXkg
ImluIHRoaXMKc3VidHJlZSwgcGxlYXNlIHByb3ZpZGUgdGhlc2UgYXJndW1lbnRzIHRvIGNoZWNr
cGF0Y2gucGwiPwoKSSBjYW4gcHJvYmFibHkgc3RpY2sgaXQgaW4gYSBSRUFETUUgZmlsZSBvciBz
b21ldGhpbmcsCmJ1dCBpcyB0aGVyZSBhbiBleGlzdGluZyBiZXN0IHByYWN0aWNlPwoKVGhhbmtz
LgoKCQkJCQktQWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9y
ZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
