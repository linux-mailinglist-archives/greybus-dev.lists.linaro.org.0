Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (ec2-54-158-76-221.compute-1.amazonaws.com [54.158.76.221])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A37FD2F
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Apr 2019 17:50:07 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C035A615C0
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Apr 2019 15:50:06 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id ADACA6089D; Tue, 30 Apr 2019 15:50:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=disabled version=3.4.2
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 37DAF60EF5;
	Tue, 30 Apr 2019 15:49:57 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 697A46089D
 for <greybus-dev@lists.linaro.org>; Tue, 30 Apr 2019 15:49:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 5C2CE608CE; Tue, 30 Apr 2019 15:49:55 +0000 (UTC)
Received: from mail-it1-f177.google.com (mail-it1-f177.google.com
 [209.85.166.177])
 by lists.linaro.org (Postfix) with ESMTPS id 5EDB76089D
 for <greybus-dev@lists.linaro.org>; Tue, 30 Apr 2019 15:49:54 +0000 (UTC)
Received: by mail-it1-f177.google.com with SMTP id w130so5420940itc.5
 for <greybus-dev@lists.linaro.org>; Tue, 30 Apr 2019 08:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G8X1W25a+Ob7ITfaeBgXcA5uPmkhmb/pB/7mFrl5ICU=;
 b=gPqFX2pro9XWfPHu/ZTN0JNeK9pbHa2KQFQqHkeGOwz6JVejlluxw7ZDYLNNyQnMC0
 6oMe03Sxmxe9ySr9l/H69XwydHPE7njBY+W/kvUFrbXkKQ2BE0bVi/Jz9HmPyoaRYDGV
 scAKqTsqDtf3349BtXa9WIzQDn2Gl8wRfNcRQ1Emk+BWTRTFd4HjRLy13Y/85yhJ2Xhr
 SxqQqMMVbobjxOr6ohZACrKN1YRg2VLKpDHBIOBxEsDeHK0LPJfNEg7hJFBXPwTU7El3
 2jHj/cTbV5cv4AUTc5WMU26FmoZdGUDXd6APe9iahanCqJXk/tJxvDiGISgWl5u+qAnS
 XUlA==
X-Gm-Message-State: APjAAAWe+ITs9LiPswVU9BMm3nTxesrL4HFv2jBGKPtb+gqj3yWzK6U3
 z1PK76pRFPqwozjTOtXosrEeKB3qMg/4GQ==
X-Google-Smtp-Source: APXvYqw3OCijYeNMQ5mkfMd78CEnG71lQ8HzzbDq4Fce4F0cSySkZq4KWjxi2EIKHsjQAniJ4rLCxQ==
X-Received: by 2002:a24:6416:: with SMTP id t22mr4163467itc.176.1556639393242; 
 Tue, 30 Apr 2019 08:49:53 -0700 (PDT)
Received: from [172.22.22.26] (c-71-195-29-92.hsd1.mn.comcast.net.
 [71.195.29.92])
 by smtp.googlemail.com with ESMTPSA id m142sm1581900itb.31.2019.04.30.08.49.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Apr 2019 08:49:52 -0700 (PDT)
To: Mark Greer <mgreer@animalcreek.com>, greybus-dev@lists.linaro.org
References: <20190430152148.GB1854@animalcreek.com>
From: Alex Elder <elder@linaro.org>
Message-ID: <791e334e-9e70-bd54-dbb2-57e03f120d4c@linaro.org>
Date: Tue, 30 Apr 2019 10:49:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430152148.GB1854@animalcreek.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] Anyone else having delays with this list?
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

T24gNC8zMC8xOSAxMDoyMSBBTSwgTWFyayBHcmVlciB3cm90ZToKPiBIaSBldmVyeW9uZS4KPiAK
PiBJcyBhbnlvbmUgZWxzZSBleHBlcmllbmNpbmcgZGVsYXlzIHJlY2VpdmluZyBlbWFpbCBmcm9t
IHRoaXMgbGlzdD8KPiAKPiBJIGp1c3QgcmVjZWl2ZWQgYSBidW5jaCB0b2RheSAoQXByaWwgMzAp
IHdpdGggc29tZSBlbWFpbHMgZGF0aW5nIGJhY2sgYXMKPiBmYXIgYXMgSmFuIDE1LgoKSSBoYXZl
bid0IG5vdGljZWQsIGJ1dCB0aGUgdHJhZmZpYyBpcyBsaWdodCBhbmQgaW50ZXJtaXR0ZW50LiAg
TmV3CnBvc3RlcnMgYXJlbid0IGFsbG93ZWQgdG8gc2VuZCB0byB0aGUgbGlzdCB3aXRob3V0IHBl
cm1pc3Npb24sIGFuZAp3ZSBsaXN0IGFkbWluaXN0cmF0b3JzIChJIHRoaW5rIGp1c3QgR2xlbiBh
bmQgSSkgbWF5IG5vdCBiZSBhcwp0aW1lbHkgYXMgd2Ugc2hvdWxkIGJlIGFib3V0IHJldmlld2lu
ZyB0aGVzZSB0aGluZ3MuCgpJIGhvcGUgYWxsIGlzIHdlbGwgd2l0aCB5b3UgTWFyaywgbmljZSB0
byBoZWFyIGZyb20geW91IQoKCQkJCQktQWxleAoKPiBUaGFua3MsCj4gCj4gTWFyawo+IC0tCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBncmV5YnVz
LWRldiBtYWlsaW5nIGxpc3QKPiBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCj4gaHR0cHM6
Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1h
aWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGlu
YXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
