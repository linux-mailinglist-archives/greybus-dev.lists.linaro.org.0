Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D11420B0E8
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Jun 2020 13:51:14 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3FBBF6659D
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Jun 2020 11:51:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 32A3B665A0; Fri, 26 Jun 2020 11:51:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 09E416659C;
	Fri, 26 Jun 2020 11:51:00 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 882556601F
 for <greybus-dev@lists.linaro.org>; Fri, 26 Jun 2020 11:50:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 770AF618C5; Fri, 26 Jun 2020 11:50:58 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by lists.linaro.org (Postfix) with ESMTPS id 73DFB618C5
 for <greybus-dev@lists.linaro.org>; Fri, 26 Jun 2020 11:50:57 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id b13so8162962ilq.11
 for <greybus-dev@lists.linaro.org>; Fri, 26 Jun 2020 04:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UtfuMFGg7RUuInhEXN7KB9S+tnoGMbSeQ/ZU0LZ7EGo=;
 b=BH60QGrI3Q62C2HpTYhlMHxE44nEv6kppcofxDngi9ts6NRIoZjET6JUni9W03MquS
 2GglXa4m3tnqm6+22mOZPM5bKNnd5QpKHkKzHCRbQDNPjP/guNWNuQ/uiK15URYRNBjs
 ATYfsl2Hm/4uAiu0L8VHlYsL1l2tqV92sa3SPKOq982OisiJGtg/aP4H1sFGVyRPi9HB
 iOlEBw7eEzTQli+62OPgaElJ1OGnUggkfxGeKg11ldBhKL/8KOUU1V1omX5LV0V4Vc1V
 JKe27S2CZLn2sEGoSoqGLizXjXdsTj8inhWZ+6PI/i3Bu5CZ2Y01j/NKMY2X5tHsdLSo
 6rOQ==
X-Gm-Message-State: AOAM5312l0dzlFG6QsF5rl2bZgPdph+wtoHBzIHMFWTtnqanm0FzhBhY
 igVfBUHadJt9iM9hI9SVxcVANFG3+FA=
X-Google-Smtp-Source: ABdhPJyZRD15OuvFt4GvRusNATIqayczMMsiVkgxz9m/xnXDtWUhNa8TOFb/d/rP2rLSjmwl8qmwtg==
X-Received: by 2002:a05:6e02:11a7:: with SMTP id
 7mr2543207ilj.17.1593172256616; 
 Fri, 26 Jun 2020 04:50:56 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id v3sm9460007ili.12.2020.06.26.04.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2020 04:50:55 -0700 (PDT)
To: Zenyu Sy <zenyu@tuta.io>, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org
References: <20200426060048.14019-1-zenyu@tuta.io>
From: Alex Elder <elder@ieee.org>
Message-ID: <10a9fed9-f692-eaf1-20d2-424f5fb9cbc1@ieee.org>
Date: Fri, 26 Jun 2020 06:50:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200426060048.14019-1-zenyu@tuta.io>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH v2] greybus: fix typos in
 GREYBUS/GREYBUS_ES2 help text
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

T24gNC8yNi8yMCAxOjAwIEFNLCBaZW55dSBTeSB3cm90ZToKPiBGcm9tOiBaZW55dSBTeSA8emVu
eXVAdHV0YS5pbz4KPiAKPiBGaXggdHlwb3MgKCJhbiIgLT4gImEiLCAiY2hvc2UiIC0+ICJjaG9v
c2UiKSBpbiBLY29uZmlnCj4gCj4gU2lnbmVkLW9mZi1ieTogWmVueXUgU3kgPHplbnl1QHR1dGEu
aW8+CgpMb29rcyBnb29kLgoKUmV2aWV3ZWQtYnk6IEFsZXggRWxkZXIgPGVsZGVyQGxpbmFyby5v
cmc+Cgo+IC0tLQo+IGJhc2UtY29tbWl0OiBmNWU5NGQxMGU0YzQ2ODM1NzAxOWU1YzI4ZDQ4NDk5
ZjY3N2IyODRmCj4gRml4ZWQgdGhlIHdoaXRlLXNwYWNlIGZvcm1hdHRpbmcgcHJvYmxlbS4KPiAg
ZHJpdmVycy9ncmV5YnVzL0tjb25maWcgfCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dy
ZXlidXMvS2NvbmZpZyBiL2RyaXZlcnMvZ3JleWJ1cy9LY29uZmlnCj4gaW5kZXggYjg0ZmNhZjhi
Li5hZWVhMDgyZjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncmV5YnVzL0tjb25maWcKPiArKysg
Yi9kcml2ZXJzL2dyZXlidXMvS2NvbmZpZwo+IEBAIC0zLDcgKzMsNyBAQCBtZW51Y29uZmlnIEdS
RVlCVVMKPiAgCXRyaXN0YXRlICJHcmV5YnVzIHN1cHBvcnQiCj4gIAlkZXBlbmRzIG9uIFNZU0ZT
Cj4gIAktLS1oZWxwLS0tCj4gLQkgIFRoaXMgb3B0aW9uIGVuYWJsZXMgdGhlIEdyZXlidXMgZHJp
dmVyIGNvcmUuICBHcmV5YnVzIGlzIGFuCj4gKwkgIFRoaXMgb3B0aW9uIGVuYWJsZXMgdGhlIEdy
ZXlidXMgZHJpdmVyIGNvcmUuICBHcmV5YnVzIGlzIGEKPiAgCSAgaGFyZHdhcmUgcHJvdG9jb2wg
dGhhdCB3YXMgZGVzaWduZWQgdG8gcHJvdmlkZSBVbmlwcm8gd2l0aCBhCj4gIAkgIHNhbmUgYXBw
bGljYXRpb24gbGF5ZXIuICBJdCB3YXMgb3JpZ2luYWxseSBkZXNpZ25lZCBmb3IgdGhlCj4gIAkg
IEFSQSBwcm9qZWN0LCBhIG1vZHVsZSBwaG9uZSBzeXN0ZW0sIGJ1dCBoYXMgc2hvd24gdXAgaW4g
b3RoZXIKPiBAQCAtMTIsNyArMTIsNyBAQCBtZW51Y29uZmlnIEdSRVlCVVMKPiAgCj4gIAkgIFNh
eSBZIGhlcmUgdG8gZW5hYmxlIHN1cHBvcnQgZm9yIHRoZXNlIHR5cGVzIG9mIGRyaXZlcnMuCj4g
IAo+IC0JICBUbyBjb21waWxlIHRoaXMgY29kZSBhcyBhIG1vZHVsZSwgY2hvc2UgTSBoZXJlOiB0
aGUgbW9kdWxlCj4gKwkgIFRvIGNvbXBpbGUgdGhpcyBjb2RlIGFzIGEgbW9kdWxlLCBjaG9vc2Ug
TSBoZXJlOiB0aGUgbW9kdWxlCj4gIAkgIHdpbGwgYmUgY2FsbGVkIGdyZXlidXMua28KPiAgCj4g
IGlmIEdSRVlCVVMKPiBAQCAtMjUsNyArMjUsNyBAQCBjb25maWcgR1JFWUJVU19FUzIKPiAgCSAg
YWN0cyBhcyBhIEdyZXlidXMgImhvc3QgY29udHJvbGxlciIuICBUaGlzIGRldmljZSBpcyBhIGJy
aWRnZQo+ICAJICBmcm9tIGEgVVNCIGRldmljZSB0byBhIFVuaXBybyBuZXR3b3JrLgo+ICAKPiAt
CSAgVG8gY29tcGlsZSB0aGlzIGNvZGUgYXMgYSBtb2R1bGUsIGNob3NlIE0gaGVyZTogdGhlIG1v
ZHVsZQo+ICsJICBUbyBjb21waWxlIHRoaXMgY29kZSBhcyBhIG1vZHVsZSwgY2hvb3NlIE0gaGVy
ZTogdGhlIG1vZHVsZQo+ICAJICB3aWxsIGJlIGNhbGxlZCBnYi1lczIua28KPiAgCj4gIGVuZGlm
CSMgR1JFWUJVUwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5v
cmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
