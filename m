Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A64C249809
	for <lists+greybus-dev@lfdr.de>; Wed, 19 Aug 2020 10:14:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 557FD60BD9
	for <lists+greybus-dev@lfdr.de>; Wed, 19 Aug 2020 08:14:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 42799619D7; Wed, 19 Aug 2020 08:14:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2822C628A2;
	Wed, 19 Aug 2020 08:13:55 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E6A9E605D8
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 20:38:03 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CA00D61718; Tue, 18 Aug 2020 20:38:03 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by lists.linaro.org (Postfix) with ESMTPS id 71101605D8
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 20:38:02 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d27so16191445qtg.4
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 13:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qItOo82livW8QC37rDaz6rglqISGnPM5/lh3qaWaPNI=;
 b=K55qmFPFB7vb9XYLd2Osfl8gR/2Ou5qJd2gINtGJKX/1UzA1WMP/774xDslTmieTDh
 +N+chX3I5L/JzXcGXieRkYOtGkZaG98FsGapviS5iUPxQwb6/wPt4pLoBGTgIYi3Oigr
 HhSk03TthjgVIs5+xVwoFc+WS4lK9CjSM5cxHCxkT0TC3+dozVZiK/uR5gJn4Qaldrof
 j/DTRJ7qGhqvHb97bNUH9J9hnLFspfGAC/uX+Qq6yoamu1fcAxXkDASeCxsd2K1wfVYT
 f4ayaXjuep2OseYsGlY3Qz2wkH/G8bNnZqV+dReCUcgpoaOStsqyvfBsbHxbr5PUTpgr
 n9fw==
X-Gm-Message-State: AOAM530Jv4ImtyLaIK6W9v4e2pi3vn+fT/7vMWH9WBTLkKnHlZhCtbQ0
 jvX6iyfOOHMhSrexz7h9JIs=
X-Google-Smtp-Source: ABdhPJzwhBwerDWFEP8tEmovT9GH2QM4AzKWy2B77z/LfntylA9XG8pPfxF/eR518aXYCiDQeLyQTQ==
X-Received: by 2002:ac8:4741:: with SMTP id k1mr19855889qtp.41.1597783082027; 
 Tue, 18 Aug 2020 13:38:02 -0700 (PDT)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net.
 [73.88.245.53])
 by smtp.gmail.com with ESMTPSA id t8sm22575113qke.7.2020.08.18.13.38.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2020 13:38:01 -0700 (PDT)
To: Vaishnav M A <vaishnav@beagleboard.org>, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de,
 johan@kernel.org, elder@kernel.org, Frank Rowand <frowand.list@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20200818124815.11029-1-vaishnav@beagleboard.org>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <d53f0014-db7c-902c-70c7-eacac41cc6ed@gmail.com>
Date: Tue, 18 Aug 2020 15:38:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818124815.11029-1-vaishnav@beagleboard.org>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 19 Aug 2020 08:13:54 +0000
Cc: rajkovic@mikroe.com, robh@kernel.org, mchehab+huawei@kernel.org,
 robertcnelson@beagleboard.org, drew@beagleboard.org, davem@davemloft.net,
 zoran.stojsavljevic@gmail.com
Subject: Re: [greybus-dev] [RFC PATCH v2 0/3] mikroBUS driver for add-on
	boards
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

SGkgVmFpc2huYXYsCgorbWUgK2RldmljZXRyZWUKClBsZWFzZSBhZGQgdGhlc2UgdHdvIHJlY2lw
aWVudHMgdG8gZnV0dXJlIHZlcnNpb25zLgoKSSB3aWxsIGNvbW1lbnQgbW9yZSBhZnRlciByZWFk
aW5nIHRoZSBmaXJzdCB2ZXJzaW9uIGFuZCB2Mi4KCi1GcmFuawoKCk9uIDIwMjAtMDgtMTggMDc6
NDgsIFZhaXNobmF2IE0gQSB3cm90ZToKPiBIaSwKPiAKPiBUaGlzIFBhdGNoIHNlcmllcyBpcyBh
biB1cGRhdGUgdG8gdGhlIG1pa3JvQlVTIGRyaXZlcgo+IFJGQyB2MSBQYXRjaCA6IGh0dHBzOi8v
bGttbC5vcmcvbGttbC8yMDIwLzcvMjQvNTE4IC4KPiBUaGUgbWlrcm9idXMgZHJpdmVyIGlzIHVw
ZGF0ZWQgdG8gYWRkIG1pa3JvYnVzIHBvcnRzIGZyb20gZGV2aWNlLXRyZWUKPiBvdmVybGF5cywg
dGhlIGRlYnVnIGludGVyZmFjZXMgZm9yIGFkZGluZyBtaWtyb2J1cyBwb3J0cyB0aHJvdWdoIHN5
c0ZTCj4gaXMgcmVtb3ZlZCwgYW5kIHRoZSBkcml2ZXIgY29uc2lkZXJzIHRoZSBleHRlbmRlZCB1
c2FnZSBvZiBtaWtyb2J1cwo+IHBvcnQgcGlucyBmcm9tIHRoZWlyIHN0YW5kYXJkIHB1cnBvc2Vz
Lgo+IAo+IGNoYW5nZSBsb2c6Cj4gICAgICAgICB2Mjogc3VwcG9ydCBmb3IgYWRkaW5nIG1pa3Jv
QlVTIHBvcnRzIGZyb20gRFQgb3ZlcmxheXMsCj4gICAgICAgICByZW1vdmUgZGVidWcgc3lzRlMg
aW50ZXJmYWNlIGZvciBhZGRpbmcgbWlrcm9idXMgcG9ydHMsCj4gICAgICAgICBjb25zaWRlciBl
eHRlbmRlZCBwaW4gdXNhZ2UvZGV2aWF0aW9ucyBmcm9tIG1pa3JvYnVzIHN0YW5kYXJkCj4gICAg
ICAgICBzcGVjaWZpY2F0aW9ucywKPiAgICAgICAgIHVzZSBncmV5YnVzIENQb3J0IHByb3RvY29s
IGVudW0gaW5zdGVhZCBvZiBuZXcgcHJvdGNvbCBlbnVtcwo+ICAgICAgICAgRml4IGNhc2VzIG9m
IHdyb25nIGluZGVuZGF0aW9uLCBpZ25vcmluZyByZXR1cm4gdmFsdWVzLCBmcmVlaW5nCj4gICAg
ICAgICBhbGxvY2F0ZWQgcmVzb3VyY2VzIGluIGNhc2Ugb2YgZXJyb3JzIGFuZCBvdGhlciBzdHls
ZSBzdWdnZXN0aW9ucwo+ICAgICAgICAgaW4gdjEgcmV2aWV3Lgo+IAo+IFZhaXNobmF2IE0gQSAo
Myk6Cj4gICBhZGQgbWlrcm9idXMgZGVzY3JpcHRvcnMgdG8gZ3JleWJ1c19tYW5pZmVzdAo+ICAg
bWlrcm9CVVMgZHJpdmVyIGZvciBhZGQtb24gYm9hcmRzIG9uIG1pa3JvYnVzIHBvcnRzCj4gICBB
ZGQgRGV2aWNlIFRyZWUgQmluZGluZ3MgZm9yIG1pa3JvQlVTIHBvcnQKPiAKPiAgLi4uL2JpbmRp
bmdzL21pc2MvbGludXgsbWlrcm9idXMudHh0ICAgICAgICAgIHwgIDgxICsrCj4gIE1BSU5UQUlO
RVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArCj4gIGRyaXZlcnMv
bWlzYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMv
bWlzYy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMv
bWlzYy9taWtyb2J1cy9LY29uZmlnICAgICAgICAgICAgICAgICB8ICAxNiArCj4gIGRyaXZlcnMv
bWlzYy9taWtyb2J1cy9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICAgNyArCj4gIGRyaXZlcnMv
bWlzYy9taWtyb2J1cy9taWtyb2J1c19jb3JlLmMgICAgICAgICB8IDY5MiArKysrKysrKysrKysr
KysrKysKPiAgZHJpdmVycy9taXNjL21pa3JvYnVzL21pa3JvYnVzX2NvcmUuaCAgICAgICAgIHwg
MTkxICsrKysrCj4gIGRyaXZlcnMvbWlzYy9taWtyb2J1cy9taWtyb2J1c19tYW5pZmVzdC5jICAg
ICB8IDQ0NCArKysrKysrKysrKwo+ICBkcml2ZXJzL21pc2MvbWlrcm9idXMvbWlrcm9idXNfbWFu
aWZlc3QuaCAgICAgfCAgMjEgKwo+ICBkcml2ZXJzL21pc2MvbWlrcm9idXMvbWlrcm9idXNfcG9y
dC5jICAgICAgICAgfCAxNzEgKysrKysKPiAgaW5jbHVkZS9saW51eC9ncmV5YnVzL2dyZXlidXNf
bWFuaWZlc3QuaCAgICAgIHwgIDQ3ICsrCj4gIDEyIGZpbGVzIGNoYW5nZWQsIDE2NzggaW5zZXJ0
aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21pc2MvbGludXgsbWlrcm9idXMudHh0Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL21pc2MvbWlrcm9idXMvS2NvbmZpZwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9t
aXNjL21pa3JvYnVzL01ha2VmaWxlCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21pc2Mv
bWlrcm9idXMvbWlrcm9idXNfY29yZS5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21p
c2MvbWlrcm9idXMvbWlrcm9idXNfY29yZS5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L21pc2MvbWlrcm9idXMvbWlrcm9idXNfbWFuaWZlc3QuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9taXNjL21pa3JvYnVzL21pa3JvYnVzX21hbmlmZXN0LmgKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvbWlzYy9taWtyb2J1cy9taWtyb2J1c19wb3J0LmMKPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxp
bmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJv
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
