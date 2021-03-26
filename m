Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E1734AD11
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Mar 2021 18:06:08 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5EBD866730
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Mar 2021 17:06:07 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4CCC066734; Fri, 26 Mar 2021 17:06:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AF763665E9;
	Fri, 26 Mar 2021 17:05:52 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C51C761731
 for <greybus-dev@lists.linaro.org>; Fri, 26 Mar 2021 17:05:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id ADCA06654F; Fri, 26 Mar 2021 17:05:50 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by lists.linaro.org (Postfix) with ESMTPS id 6C19961731
 for <greybus-dev@lists.linaro.org>; Fri, 26 Mar 2021 17:05:49 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id kt15so9440523ejb.12
 for <greybus-dev@lists.linaro.org>; Fri, 26 Mar 2021 10:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TZpUocbZkJ2maV4+ZrCzVZctv3jGZXxi51+s/78q/tc=;
 b=VhrT72PEivXQFELO7Y+wjKARlOGGJbCScm/+IfGOHyPGxFCRwWbYkVaeY9K95AX0lf
 Ltn2WbZhWtsLbnC5LdfpErYTJYW/DZvoz05nuEnM2JLLIjZSEpm937oZhlpbOeCA3y72
 ulhykY0xgPjV0pTSrYQ2CXB1F2WdxXe4jjnhzT84+4G81G4uso4gRbrMpT0P4WjqdnDU
 CVs5K/xjWwvTc7JeW14K4iWHVCcs09vRkmAhvAaQ6WJHAU5qq1E9zxqgTHVknR4c/GfE
 9CZvaxN60gshp9e+Dl0i64+NDNd5tqRIUc1d9YlEcg+2Dsz3pQchDw7WLlw9Rem3Zh1A
 y38A==
X-Gm-Message-State: AOAM533AAcyaobHltA55oaaIJB7EXth1WoNQoiRgEbdHdJSlLJ8Y4ZzQ
 toPS+cR1847oPEohTkEsLp5CQw==
X-Google-Smtp-Source: ABdhPJybappXfN7dWpVL5+yt5MX2ruCnnHlsUmQ5duDm/DTZ9e0TkroNuFHKlW7Wcvht4/IDPhL09w==
X-Received: by 2002:a17:906:5d05:: with SMTP id
 g5mr16374503ejt.489.1616778348539; 
 Fri, 26 Mar 2021 10:05:48 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.71.248])
 by smtp.gmail.com with ESMTPSA id n3sm4046213ejj.113.2021.03.26.10.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 10:05:48 -0700 (PDT)
To: Alex Elder <elder@linaro.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210326152254.733066-1-linux@rasmusvillemoes.dk>
 <3a04ad94-f8c3-4d2e-c6a2-d498ac3cbeb0@linaro.org>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <bca9a507-0cfb-936c-5fce-a5fa3f05b0cd@rasmusvillemoes.dk>
Date: Fri, 26 Mar 2021 18:05:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <3a04ad94-f8c3-4d2e-c6a2-d498ac3cbeb0@linaro.org>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] greybus: remove stray nul byte in
 apb_log_enable_read output
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

T24gMjYvMDMvMjAyMSAxNy4zMSwgQWxleCBFbGRlciB3cm90ZToKPiBPbiAzLzI2LzIxIDEwOjIy
IEFNLCBSYXNtdXMgVmlsbGVtb2VzIHdyb3RlOgo+PiBJbmNsdWRpbmcgYSBudWwgYnl0ZSBpbiB0
aGUgb3RoZXJ3aXNlIGh1bWFuLXJlYWRhYmxlIGFzY2lpIG91dHB1dAo+PiBmcm9tIHRoaXMgZGVi
dWdmcyBmaWxlIGlzIHByb2JhYmx5IG5vdCBpbnRlbmRlZC4KPiAKPiBMb29raW5nIG9ubHkgYXQg
dGhlIGNvbW1lbnRzIGFib3ZlIHNpbXBsZV9yZWFkX2Zyb21fYnVmZmVyKCksCj4gdGhlIGxhc3Qg
YXJndW1lbnQgaXMgdGhlIHNpemUgb2YgdGhlIGJ1ZmZlciAodG1wX2J1ZiBpbiB0aGlzCj4gY2Fz
ZSkuwqAgU28gIjMiIGlzIHByb3Blci4KClRoZSBzaXplIG9mIHRoZSBidWZmZXIgaXMgMyBiZWNh
dXNlIHRoYXQncyB3aGF0IHNwcmludGYoKSBpcyBnb25uYSBuZWVkCnRvIHByaW50IG9uZSBkaWdp
dCwgJ1xuJyBhbmQgYSBudWwgYnl0ZS4gVGhhdCBkb2Vzbid0IG5lY2Vzc2FyaWx5IGltcGx5CnRo
YXQgdGhlIGVudGlyZSBidWZmZXIgaXMgbWVhbnQgdG8gYmUgc2VudCB0byB1c2Vyc3BhY2UuCgo+
IEJ1dCBsb29raW5nIGF0IGNhbGxlcnMsIGl0IHNlZW1zIHRoYXQgdGhlIHRyYWlsaW5nIE5VTCBp
cwo+IG9mdGVuIGV4Y2x1ZGVkIHRoaXMgd2F5Lgo+IAo+IEkgZG9uJ3QgcmVhbGx5IGhhdmUgYSBw
cm9ibGVtIHdpdGggeW91ciBwYXRjaCwgYnV0IGNvdWxkCj4geW91IGV4cGxhaW4gd2h5IGhhdmlu
ZyB0aGUgTlVMIGJ5dGUgaW5jbHVkZWQgaXMgYW4gYWN0dWFsCj4gcHJvYmxlbT/CoCBBIHNob3J0
IHN0YXRlbWVudCBhYm91dCB0aGF0IHdvdWxkIHByb3ZpZGUgYmV0dGVyCj4gY29udGV4dCB0aGFu
IGp1c3QgInByb2JhYmx5IG5vdCBpbnRlbmRlZC4iCgpkZWJ1Z2ZzIGZpbGVzIGFyZSBBRkFJSyBp
bnRlbmRlZCB0byBiZSB1c2VkIHdpdGggc2ltcGxlICJjYXQgZm9vIiwgImVjaG8KMSA+IGZvbyIg
aW4gc2hlbGwgKHNjcmlwdHMgYW5kIGludGVyYWN0aXZlKS4gSGF2aW5nIG5vbi1wcmludGFibGUK
Y2hhcmFjdGVycyByZXR1cm5lZCBmcm9tIHRoYXQgImNhdCBmb28iIGlzIG9kZCAoYW5kIGNhbiBz
b21ldGltZXMgYnJlYWsKc2NyaXB0cyB0aGF0IGUuZy4gImdyZXAgMSBmb28vKi8qL2JhciIgd2hl
biBncmVwIHN0b3BzIGJlY2F1c2UgaXQgdGhpbmtzCm9uZSBvZiB0aGUgZmlsZXMgaXMgYmluYXJ5
LCBvciB3aGVuIHRoZSBvdXRwdXQgb2YgdGhhdCBpcyBmdXJ0aGVyIHBpcGVkCnNvbWV3aGVyZSku
CgpBdCB0aGUgdmVyeSBsZWFzdCwgaXQncyBpbmNvbnNpc3RlbnQgZm9yIHRoaXMgb25lLCB0aG9z
ZSBpbgpncmV5YnVzL3N2Yy5jIGRvIGp1c3QgcmV0dXJuIHRoZSBhc2NpaSBkaWdpdHMgYW5kIHRo
ZSBuZXdsaW5lIChhbmQgaWYKb25lIGZvbGxvd2VkIHlvdXIgYXJndW1lbnQgYWJvdmUgYW5kIGxl
dCB0aG9zZSBwYXNzIDE2IGluc3RlYWQgb2YgZGVzYwpvbmUgd291bGQgbGVhayBhIGZldyBieXRl
cyBvZiB1bmluaXRpYWxpemVkIGtlcm5lbCBzdGFjayB0byB1c2Vyc3BhY2UpLgoKSSBzYWlkICJw
cm9iYWJseSBub3QgaW50ZW5kZWQiIGJlY2F1c2UgZm9yIGFsbCBJIGtub3csIGl0IG1pZ2h0IGJl
CmludGVudGlvbmFsLiBJIGp1c3QgZG91YnQgaXQuCgpSYXNtdXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0Cmdy
ZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxt
YW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
